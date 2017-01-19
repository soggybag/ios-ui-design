# UIView 

UIView is the baseclass for everything that appears on the screen.
UIView defines a rectangular area on the screen and the interfaces for managing what is displayed there. 
UIView subclasses UIResponder. UIResponder allows user interaction. With these two 
features UIView can detect user interaction and respond by changing it's appearance.

** What does Apple say about UIView ** 

Read to the end of 'Alternatives to Subclassing'. 

[https://developer.apple.com/reference/uikit/uiview](https://developer.apple.com/reference/uikit/uiview)

Important points 

- A view handles rendering content in it's area. 
- A view handles interactions with that content. 
- Views can contain subviews.
    - These views are defined in a hierarchy.
- The size and position of a view is set by the frame, bounds and center. 
    - Frame defines a view's size and position in it's super view.
    - Bounds defines a view's internal dimensions. 
    - Frame and bounds are related changing one changes the other. 
- A view can be added as a child of another with view.addSubView(_:).
- When drawing occurs the system asks the view to draw it's contents by calling draw(_:). 
    - Your implementation is responsible for drawing the view's contents into the current graphics 
    context. 
- When the content of a view changes it is your responsibility to call setNeedsDisplay().
This triggers the draw(_:) the next time the system updates the screen. 
- Without custom code a view draws a rectangle filled with it's background color into it's rectangle. 

Pay close attention to the **Methods to Override** section. These methods provides hooks where you 
can configure a custom views behaviors. 

## Tutorial and Chellenges 

Follow this tutorial it has some built in challenges at the end. 

[https://www.weheartswift.com/uiview-fundamentals/](https://www.weheartswift.com/uiview-fundamentals/)

## Conclusion

After reading the material and working through the tutorial and it's challenges you should have a 
pretty good idea of how UIView works. As you work with the other UIView elements remember what you 
learned here and consider that each of these elements (UIButton, UISwitch, UISegmentedControl etc.)
are all created from a UIView! 