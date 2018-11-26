import XCTest
@testable import Pascal

class SourceTests: XCTestCase {
    private func sourceWith(string: String) -> Source {
        let reader = StringReader(string)
        let source = Source(reader: reader)
        return source
    }

    func testReadFirstChar() {
        let source = sourceWith(string: "bork")
        let firstPost = source.currentChar()
        XCTAssertEqual(firstPost, "b")
    }
}
