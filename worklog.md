# Worklog

==================================================
# Monday November 19, 2018

First post!  Read intro chapter - mainly review (I've been doing this
stuff a long time).  Never took a compiler class, so the guts will
be new to me.

Chapter 2 has the big-bang design of the various "frameworks" (in the
UML sense if I'm interpreting _(heh)_ things right.).  I'm planning on
everything being one big happy pile of source for now, given that
Xcode frameworks are annoying, especialy if you're working outside
of Xcode itself (like I am).

Planning on abstract interfaces being protocols.  Going to default
to classes for things because that's how I think after decades of
obj-orented-C, C++, ObjC, (and even some object Pascal).  Plus the source
material is Java, so OOP-styles is the prevailing flavor.

I'm not sure how things will m6t, so making an Xcode project for a Cocoa
app, but everything starts in didFinishLunching.

----------

Added `Parser.swift` for Listing 2-1.  It's just an abstract class, becoming
a protocol. Stubbed in empty protocols for the referenced types.

----------

Source (Listing 2-2) looks like a concrete implementation of stuff.  Might
want to add some unit tests.  First going to add stubbed API, then actually
implement the things.

It's a very C-stdlib like "Read next line.  Go through characters++".
So, will need to learn:
- [ ] Reading from a file line-by-line (or be lazy and just read in the whole thing)
- [ ] Moving through this character by character
- [ ] Best data type for "hey this is a single character" in SwiftStringLand.


==================================================
# Sunday November 25, 2018

Adding the buffered reader, because why not.  It's an abstraction around reading
from strings or files.  So flesh it out based on how it's used in `Source`.

Plus I can start adding unit tests.  woo.

Added unit test.  Xcode decided that my test-class is always failing with a reg
sigil, but all tests pass fine. #ilyxc.  sigh.  Clearning the build folder doesn't
work.  Have to quit Xcode.

Also got a "Command MergeSwiftModule failed with non-zero success code".  #ilyx

----------

With that suckage out of the way, TDD in the Source junk.

_many commits later_

OK, got Source implemented plus more tests.

Doing a coverage run. 97.8.  And that's a precondition failure at
characterAtIndex. I can live with that.

ok cool, now to continue reading after the Source implementation

NEXT: Scanner on page 22.


==================================================
# Thursday December 20, 2018

Starting with the Scanner.  Adding Scanner.swift, and adding the stub abstract
class.  Calling it BaseScanner.  Uses Source for getting characters.

landed.

Then Token - it's a base class (not an abstract class it seems).  But has
stubs, and covers for the `Source`

From the book, (page 25)
* scanner constructs tokens, and returns to the parser.
* TokenType is an interface, can set the type field to a language-specific
  value _(right now placeholding for `Any` - Java is using `Object`)
* next chapter will show how the scanner determines the type of the next token
  to construct based n the current source character, which will become the initial
  character for the token.

e.g. if the initial chraceter is a digit, the next token is a number.  If
the initial character is a letter, the next otken is either an identifier or a reserved
word.

Since represent different types using sublasses of the token class, scanner will
call the constructor othe appropriate token subclass based on the initial character
_(Maybe a Generics opportunity?)_

`extract` does the actual work of constructing the token, extracts
by reading characters. Subclasses implement this to pick up their tokens
(this has just a single-character nommer)

NEXT: continue scanner on page 26
