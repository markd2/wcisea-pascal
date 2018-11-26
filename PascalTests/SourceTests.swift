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

    func testPeking() {
        // peek at the beginning.  The 'current character' would be "b", so
        // peeking at the Next would be "o"
        let source = sourceWith(string: "bork")

        // peek before scanning
        let peek1 = source.peekChar()
        XCTAssertEqual(peek1, "o")
        
        // shouldn't advance
        let peek1again = source.peekChar()
        XCTAssertEqual(peek1again, "o")

        // advance and read next one.
        let next = source.nextChar()
        XCTAssertEqual(next, "o")
        let peek2 = source.peekChar()
        XCTAssertEqual(peek2, "r")

        // Not testing that peeking off the end is going to give EOL/EOF
        // (the translation of the Java implementation falls off the end of
        // the string), so assuming it's not case that actually comes up in usage.
    }

    func testScan() {
        let source = sourceWith(string: "hello\nThere\n")
        let expectedScan = [
          "h", "e", "l", "l", "o", Source.EOL,
          "T", "h", "e", "r", "e", Source.EOL,
          Source.EOF
        ]

        for expected in expectedScan {
            let character = source.nextChar()
            XCTAssertEqual(expected, character)
        }
    }

    func testClose() {
        // purely for coverage
        let source = sourceWith(string: "snorgle")
        source.close()
    }
}
