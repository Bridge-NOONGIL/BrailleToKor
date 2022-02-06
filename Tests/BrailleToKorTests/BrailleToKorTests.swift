import XCTest
@testable import BrailleToKor

final class BrailleToKorTests: XCTestCase {
    func testExample() throws {
        // This is an example of a functional test case.
        // Use XCTAssert and related functions to verify your tests produce the correct
        // results.
//        XCTAssertEqual(BrailleToKor.translation("abc"), "Hello, World!")
        print(BrailleToKor.translation("⠉⠝⠄⠠⠨⠗ ⠚⠧⠠⠻⠕⠤⠌⠬ ⠚⠧⠠⠻⠿⠿⠿⠵ ⠿⠛⠛⠛⠛⠛⠛⠛⠛⠛⠛⠛⠛⠛⠿"))
        
    }
}
