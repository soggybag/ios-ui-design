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

## Notes 

The tutorial example above was written in an earlier version of Swift. A few of the functions have 
changed. 

**CGAffineTransform**

CGAffineTransform() can be initialized with rotation, scale, or translate. 

`let rotate = CGAffineTransform(rotationAngle: CGFloat)`

`let scale = CGAffineTransform(scaleX: CGFloat, y: CGFloat)`

`let translate = CGAffineTransform(translationX: CGFloat, y: CGFloat)`

**CGAffineTransformConcat**

This has been replaced with member methods. Instead of creating new transforms and merging with concat
you'll call a memeber method to apply the transform like this: 

```
let scale = CGAffineTransform(scaleX: 0.5, y: 0.5)
let scaleRotate = scale.rotated(by: CGFloat(M_PI_2 / 2))
let scaleRotatetranslate = scaleRotate.translatedBy(x: 100, y: 40)
```

## Challenges 

The tutorial has some built in challenges solve these. Then solve them again with these goals: 

- Solve the challenges with layers. Each challenge should be built in a single UIView with elements
drawn on sublayers. 
- Use IBDesignable to set properties that control how the elements appear. 
    - For the target set the number of rings
    - The width of each ring
    - Ring color
- Look up CAGradientLayer. Use this to make a gradient layer. 
    - Use IBDesignable on your view containing the gradient layer. 
    - Use IBInspectable to set the starting and ending color for the gradient. 

## Conclusion

After reading the material and working through the tutorial and it's challenges you should have a 
pretty good idea of how UIView works. As you work with the other UIView elements remember what you 
learned here and consider that each of these elements (UIButton, UISwitch, UISegmentedControl etc.)
are all created from a UIView! 