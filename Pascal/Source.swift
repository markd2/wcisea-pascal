import Foundation

class Source {
    typealias Char = String // TBD: how swift represents one character
    
    /// End-of-Line character
    static let EOL: Char = "\n"

    /// End-of-File character
    static let EOF: Char = "\0"

    // private BufferedReader reader;   // reader for the source program
    private var line = ""		// source line
    private var lineNum = 0		// current source line number
    private var currentPosition = 0	// current source line position

    init(/*Reader*/) {
        line = ""
        lineNum = 0
        currentPosition = -2 // set to -2 to read the first source line. (?)
        self.reader = reader
    }

    // Return the source character at the current position.
    // The book throws an exception, but doesn't explicitly do so, figuring
    // it's their BufferedReader that's doing that. So we're not throwing _(yet)_
    // Returns EOL/EOF at end of line/file
    func currentChar() -> Char {
        // TODO - more
        return "x"
    }

    /// Consume the current source character and return the next one.
    func nextChar() -> Char {
        currentPosition += 1
        return currentChar()
    }

    /// Return the source character following the current character without consuming it.
    func peekChar() -> Char {
        // TODO - more
        return "x"
    }

    /// Reads the next source line
    private func readLine() {
        // TODO - more
    }

    /// Closes the source
    func close() {
        // TODO - more
    }
}

