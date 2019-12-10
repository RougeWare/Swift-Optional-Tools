import XCTest
@testable import OptionalTools

final class OptionalToolsTests: XCTestCase {
    func testExample() {
        // This is an example of a functional test case.
        // Use XCTAssert and related functions to verify your tests produce the correct
        // results.
        XCTAssertEqual(OptionalTools().text, "Hello, World!")
    }

    static var allTests = [
        ("testExample", testExample),
    ]
}
