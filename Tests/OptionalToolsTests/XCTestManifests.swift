import XCTest

#if !canImport(ObjectiveC)
public func allTests() -> [XCTestCaseEntry] {
    return [
        testCase(UnwrappedOrThrow_Tests.allTests),
        testCase(Optional_operators_Tests.allTests),
    ]
}
#endif
