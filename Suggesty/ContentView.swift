//
//  ContentView.swift
//  Suggesty
//
//  Created by Michael Frick on 29.04.21.
//

import SwiftUI
import Foundation

struct ContentView: View {
  
  init() {
    let suggestSearch = SuggestSearch()
    let index = suggestSearch.indexKeys(["asd", "abbaa"])
    
    index.printWords()
  }
  
  var body: some View {
    Text("Hello, world!")
      .padding()
  }
}

struct ContentView_Previews: PreviewProvider {
  static var previews: some View {
    ContentView()
  }
}



class SuggestSearch {
  func indexKeys(_ keys: [String]) -> Trie {
    let trie = Trie()
    
    if let json = readJson() {
      let unis: [University] = try! JSONDecoder().decode([University].self, from: json)
      
      for uni in unis {
        trie.insertKey(uni.name)
      }
    }
 
    
    
    
    return trie
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


