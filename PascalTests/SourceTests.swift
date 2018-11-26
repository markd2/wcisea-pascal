import XCTest
@testable import Pascal

class SourceTests: XCTestCase {
    func testReadFirstChar() {
        let reader = StringReader("bork")
        let source = Source(reader: reader)
        let firstPost = source.currentChar()
        XCTAssertEqual(firstPost, "b")
    }
}
