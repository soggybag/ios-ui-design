# Motion 

UIKit provides a few ways to make things move. 

## UIView Animation

UIView provides a helper method that makes it easy to create simple aniamtions. 

Limited to these properties: 

- frame: Modify this property to change the view’s size and position relative to its superview’s coordinate system. (If the transform property does not contain the identity transform, modify the bounds or center properties instead.)
- bounds: Modify this property to change the view’s size.
- center: Modify this property to change the view’s position relative to its superview’s coordinate system.
- transform: Modify this property to scale, rotate, or translate the view relative to its center point. Transformations using this property are always performed in 2D space. (To perform 3D transformations, you must animate the view’s layer object using Core Animation.)
- alpha: Modify this property to gradually change the transparency of the view.
- backgroundColor: Modify this property to change the view’s background color.
- contentStretch: Modify this property to change the way the view’s contents are stretched to fill the available space.

## CABasicAnimation 

If you can't animate a property with UIView.animate() you can probably animate it with 
CABasicAnimation. 

## Challenges 

- Make a loading screen
- Make a landscape
- Animate a progress bar
- 

