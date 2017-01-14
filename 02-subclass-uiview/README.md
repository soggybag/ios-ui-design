# Making Views Special

Subclass UIView as SpecialView

- SpecialViews are special because they have a color.
  - Use an init to set the color
  - Use a custom init to add a color when a view is created
  - Use Class properties to get the colors used by SpecialViews

## frame, bounds, center

Frame positions a 

### CGFloat

Essentially a Double/Float. It holds a 32 or 64 bit value depending on the
system. Imagine it as a number that is optimized for use in Core Graphics
operations.

Anything working with graphics on the screen will probably use a CGFloat.

- Position
- Size
- Color

### CGPoint

A CGPoint represents two values that map to a coordinate on the screen. CGPoint
has two properties:

- x
- y

https://developer.apple.com/reference/coregraphics/cgpoint

### CGSize

A Struct representing the size of a rectangle. It has two properties.

- width
- height

https://developer.apple.com/reference/coregraphics/cgsize

### CGRect

A CGRect represents 4 values that represent the position and size of a rectangle
on the screen.

- x
- y
- width
- height

Besides these properties a CGRect also has:

- origin: A CGPoint containing x and y
- size: A CGSize containing width and height

But wait there's more!

- minX: The smallest value for the x-coordinate of the rectangle. Imagine this
as the position of the left edge.
- minY: The smallest value for the y-coordinate of the rectangle. Imagine this
as the position of the top edge.
- maxX: The largest value for the x-coordinate of the rectangle. Imagine this
to be the position of the right edge.
- maxY: The largest value of of the y-coordinate of the rectangle. Think of
this as the position of the bottom edge.
- midX: The half way point between, or center, between the left and right edges.
- midY: The mid point between the top and bottom edges.

Besides these properties CGRect has many methods that return a CGRect's
modified in one way or another.

- insetBy: Returns a rect inset by an amount. Imagine drawing a rectangle inside
the current rectangle.
- offsetBy: returns a rect offset, moved, some amount on the x and y.
- union: Returns the smallest rectangle that contains both rects. Imagine
drawing a box around two boxes that just fits them both.
- intersection: Returns a rectangle that represents the intersection of two
rectangles. Imagine the box where two rectangles overlap.

And more...

Besides these methods there are methods to determine if a point or rect is
contained in a rect.

These tools are there for you modify rectangles. You'll use these to determine
where a UIView is on the screen, move of size views, modify views to fit an area
and more.

https://developer.apple.com/reference/coregraphics/cgrect

## Using Initializers

Swift supports multiple initializers.

A subclass must call the default initializer in it's super class.

Use initializers to simplify your work and make your subclasses more flexible.

## UIColor

Some notes on UIColor

Default colors

UIColor's various initializers

- RGB
- HSB
- White

##
