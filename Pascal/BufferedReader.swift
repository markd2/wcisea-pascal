import Foundation

protocol BufferedReader {
    func readLine() throws -> String?
}

class StringReader: BufferedReader {
    private let string: String
    private let lines: [String]
    private var currentLine = 0

    init(string: String) {
        self.string = string
        lines = string.components(separatedBy: "\n")
    }

    func readLine() throws -> String? {
        guard currentLine < lines.count else {
            return nil
        }
        currentLine += 1
        return lines[currentLine - 1]
    }
}
