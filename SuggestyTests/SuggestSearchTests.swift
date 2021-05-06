import XCTest
@testable import Suggesty

class SuggestSearchTests: XCTestCase {

  func test() throws {
    // Prepare
    let testString1 = "Anna"
    let testString2 = "Ana"
    let testString3 = "Alba"
    let testString4 = "Analytics"
    let sut = SuggestSearch()
    
    // Execute
    let trie = sut.indexKeys([testString1, testString2, testString3, testString4])
    let result = sut.search(query: "a", trie: trie)
    
    // Validate
    XCTAssertEqual(result, ["alba", "ana", "analytics", "anna"])
  }

}
