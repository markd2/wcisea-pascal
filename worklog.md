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
