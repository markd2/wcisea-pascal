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
    
    func testEOL() {
        let source = sourceWith(string: "")
        let char = source.currentChar()
        XCTAssertEqual(char, Source.EOL)
    }

    func testEOF() {
        let source = sourceWith(string: "")
        let _ = source.currentChar()
        let eof = source.nextChar()
        XCTAssertEqual(eof, Source.EOF)
    }
}
