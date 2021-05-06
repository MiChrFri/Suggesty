import SwiftUI
import Foundation

struct ContentView: View {
  private let suggestSearch = SuggestSearch()
  private var index: Trie?
  var universityMap: [String: University] = [:]
  @State private var searchTerm: String = ""
  @State private var result: [String] = []
  
  init() {
    let reader = DataReader()
    let unis = reader.readUnis()
    let uniNames = unis.map(\.name)
    universityMap = createUniMap(universities: unis)
    index = suggestSearch.indexKeys(uniNames)
  }
  
  private func createUniMap(universities: [University]) -> [String: University]{
    var map: [String: University] = [:]
    for uni in universities {
      map[uni.name.lowercased()] = uni
    }
    return map
  }
  
  var body: some View {
    let binding = Binding<String>(get: {
      self.searchTerm
    }, set: {
      self.searchTerm = $0
      if let trie = index {
        result = suggestSearch.search(query: searchTerm, trie: trie)
      }
    })
      
    Text("Snoogle")
      .font(.largeTitle)
      .fontWeight(/*@START_MENU_TOKEN@*/.bold/*@END_MENU_TOKEN@*/)
      .foregroundColor(Color("calmBlue"))
    
    TextField("search", text: binding)
      .padding()
      .background(Color("lightGray"))
      .foregroundColor(Color.black)
      .cornerRadius(20)
      .padding()
    
    List(result.indices, id: \.self) { index in
      let uniName = result[index]
      let uni = universityMap[uniName]
      Text(uni?.name ?? "")
      Text(uni?.country ?? "")
        .foregroundColor(.gray)
    }
  }
}

struct ContentView_Previews: PreviewProvider {
  static var previews: some View {
    ContentView()
  }
}






