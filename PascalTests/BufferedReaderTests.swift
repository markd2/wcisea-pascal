import XCTest
@testable import Pascal

class BufferedReaderTests: XCTestCase {

    func testReadThreeLines() {
        let testString = "one\ntwo\nthree"

        let reader = StringReader(testString)

        let first = try! reader.readLine()
        XCTAssertEqual(first, "one")
        let second = try! reader.readLine()
        XCTAssertEqual(second, "two")
        let third = try! reader.readLine()
        XCTAssertEqual(third, "three")
        
        let offTheEnd = try! reader.readLine()
        XCTAssertNil(offTheEnd)
    }

    func testClose() {
        // Purely for coverage.
        let reader = StringReader("Greeble")
        try! reader.close()
    }
}

