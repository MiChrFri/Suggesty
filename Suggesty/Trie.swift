struct Trie {
  private var head = Node()
  
  func insertKey(_ key: String) {
    let letters = Array(key)
    addLetters(letters)
  }
  
  func printWords() {
    revealWords(node: self.head, prefix: "")
  }
  
  private func revealWords(node: Node, prefix: String) {
    for (_, v) in node.childNodes {
      let prefix = "\(prefix)\(v.value)"
      if v.end {
        print("💚💚💚 \(prefix)")
      } else {
        revealWords(node: v, prefix: prefix)
      }
    }
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
  
  //MARK:  NODE IMPL
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
