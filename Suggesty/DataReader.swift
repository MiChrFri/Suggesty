import Foundation

final class DataReader {
  
  func readUnis() -> [University] {
    guard let json = readJson() else { return [] }
    return try! JSONDecoder().decode([University].self, from: json)
  }
  
  private func readJson() -> Data? {
    do {
      if let bundlePath = Bundle.main.path(forResource: "universities", ofType: "json"),
         let jsonData = try String(contentsOfFile: bundlePath).data(using: .utf8) {
        return jsonData
      }
    } catch {
      print(error)
    }
    
    return nil
  }
}
