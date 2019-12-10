import XCTest
@testable import OptionalTools

final class OptionalToolsTests: XCTestCase {
    
    func testUnwrappedOrThrow() {
        let hasValue: Int? = 1
        let noValue: Int? = nil
        
        XCTAssertNoThrow(try hasValue.unwrappedOrThrow())
        XCTAssertEqual(try hasValue.unwrappedOrThrow(), 1)
        
        XCTAssertNoThrow(try hasValue.unwrappedOrThrow(error: TestError()))
        XCTAssertEqual(try hasValue.unwrappedOrThrow(error: TestError()), 1)
        
        XCTAssertThrowsError(try noValue.unwrappedOrThrow())
        XCTAssertThrowsError(try noValue.unwrappedOrThrow()) { error in
            XCTAssertTrue(error is UnexpectedlyFoundNilError)
        }
        
        XCTAssertThrowsError(try noValue.unwrappedOrThrow(error: TestError()))
        XCTAssertThrowsError(try noValue.unwrappedOrThrow(error: TestError())) { error in
            XCTAssertTrue(error is TestError)
        }
    }
    
    
    static var allTests = [
        ("testUnwrappedOrThrow", testUnwrappedOrThrow),
    ]
}



private struct TestError: Error {}
