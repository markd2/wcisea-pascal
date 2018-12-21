import Foundation

/// Abstract Scanner class, language-specific subclasses will implement
/// `extractToken`
protocol Scanner: class {
    func currentToken() -> Token?  // need optional?
    func nextToken() -> Token?
}

/// The book has an abstract class for this
class BaseScanner: Scanner {
    var source: Source
    private var _currentToken: Token?
    
    init(source: Source) {
        self.source = source
    }

    /// ok to just expose the var?
    func currentToken() -> Token? {
        return _currentToken
    }
    

    /// Return the next token from the source
    func nextToken() -> Token? {
        return nil
    }

    /// `protected abstract`
    /// Do the actual work of extracting and returning the next token from the source.
    /// Implemented by scanner subclasses.
    func extractToken() {
        // java version throws an exception
    }

    /// Call the source's currentChar - return the current character from the source
    func currentChar() -> Char {
        return source.currentChar()
    }

    /// Call the source's nextChar - return the next character from the source
    func nextChar() -> Char {
        return source.nextChar()
    }
}

