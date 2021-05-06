import Foundation

final class SuggestSearch {
  func indexKeys(_ keys: [String]) -> Trie {
    let trie = Trie()
    for key in keys {
      trie.insertKey(key.lowercased())
    }
    return trie
  }
  
  func search(query: String, trie: Trie) -> [String] {
    guard query.count > 0 else { return [] }
    let result = trie.search(term: query.lowercased())
    return result
  }
  
}


