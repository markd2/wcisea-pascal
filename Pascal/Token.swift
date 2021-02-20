import Foundation

protocol TokenType { }

/// The framework class that represents a token returned by the scanner.
class Token {
    // java version are `protected`
    var text: String?    // token text

    // ??? Could this be generic-driven rather than type+anyobject?
    var type: TokenType? // language-sepcific token type
    var value: Any?      // token value

    var lineNumber: Int
    var position: Int
    private var source: Source

    init(source: Source) {
        self.source = source
        lineNumber = source.lineNum
        position = source.currentPosition
        
        extract()
    }

    /// `extract` does the actual work of constructing the token,
    /// Default method to exract only one-character tokens from the source.
    /// Subclasses can override this to construct language-specific  tokens.
    /// After extracting the token, the current source line position will
    /// be one beyond the last token character.
    /// (java version threw if an error occurred.)
    ///
    /// subclasses are expected to leave the current source line position 
    /// _one beyond_ the las token character (c.f. page 25)
    func extract() {
        text = String(currentChar())
        value = nil

        _ = nextChar()  // consume current character
    }

    // covers for the source methods, I'm presuming to hide the use of `Source`
    func currentChar() -> Char {
        return source.currentChar()
    }

    func nextChar() -> Char {
        return source.nextChar()
    }

    func peekChar() -> Char {
        return source.peekChar()
    }
}


