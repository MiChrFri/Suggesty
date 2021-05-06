import XCTest
@testable import Suggesty

class TrieTests: XCTestCase {

  func testSetupTrie() throws {
    // Prepare
    let testWords = ["Swift", "swift", "Swing", "Car", "Carefree"]
    let sut = Trie()
    
    testWords.forEach { sut.insertKey($0) }
    
    // Execute
    let words = sut.storedWords()
    
    // Validate
    XCTAssertEqual(words.sorted(), testWords.sorted())
  }
  
  func testSearchShouldReturnExpectedResults() throws {
    // Prepare
    let testWords = ["Swift", "swift", "Swing", "Car", "Carefree"]
    let sut = Trie()
    
    testWords.forEach { sut.insertKey($0) }
    
    // Execute
    let result1 = sut.search(term: "Bob")
    let result2 = sut.search(term: "Sw")
    let result3 = sut.search(term: "Swing")
    
    // Validate
    XCTAssertEqual(result1, [])
    XCTAssertEqual(result2, ["Swift", "Swing"])
    XCTAssertEqual(result3, ["Swing"])
  }
  
  func testSearchShouldNotReturnMoreThan5Results() throws {
    // Prepare
    let testWords = ["Swift", "Swifty", "Swing", "Swine", "Swiggle", "Swish", "Swiiii"]
    let sut = Trie()
    
    testWords.forEach { sut.insertKey($0) }
    
    // Execute
    let result = sut.search(term: "Swi")
    
    // Validate
    XCTAssertEqual(result, ["Swift", "Swifty", "Swiggle", "Swiiii", "Swine"])
  }
 
}
