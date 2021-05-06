struct Trie {
  private var head = Node()
  
  //MARK: public interface
  func insertKey(_ key: String) {
    let letters = Array(key)
    addLetters(letters)
  }
  
  func search(term: String) -> [String] {
    var node = head
    for char in term {
      guard let matching = node.childNodes[char] else { return [] }
      node = matching
    }
    var result = revealWords(node: node, prefix: term)
    if result.count >= 5 {
      result = Array(result[..<5])
    }
    return result
  }
  
  func storedWords() -> [String] {
    return revealWords(node: head, prefix: "")
  }
 
  //MARK: private
  private func revealWords(node: Node, prefix: String) -> [String] {
    var words = [String]()
    for (_, v) in node.childNodes {
      let prefix = "\(prefix)\(v.value)"
      if v.end {
        words.append(prefix)
      }
      words.append(contentsOf: revealWords(node: v, prefix: prefix))
    }
    if (node as? ChildNode)?.end == true {
      words.append(prefix)
    }
    return words.uniques().sorted()
  }
  
  private func addLetters(_ letters: [Character]) {
    var node = head
    
    for char in letters {
      if node.childNodes[char] == nil {
        node.childNodes[char] = ChildNode(value: char)
      }
      node = node.childNodes[char]!
    }
    (node as? ChildNode)?.end = true
    
  }
}

//MARK:  NODE IMPL
extension Trie {
  private class Node {
    var childNodes = [Character: ChildNode]()
  }
  
  private class ChildNode: Node {
    var value: Character
    var end: Bool = false
    
    init(value: Character) {
      self.value = value
    }
  }
  
}
