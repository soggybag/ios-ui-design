# Motion 

UIKit provides a few ways to make things move. The number and variety of options makes animation 
with UIKit a bit of a jungle. To understand animation in UIKit it helps to work through the 
available options methodically and consider why each option exists. I will try and do that here. 

Animation can be broken down into a few categories. Each category may requires a different technique.
Making things move, rotate, scale, fade in or out, can be handled setting properties and transforming
an object. Animations that draw things on the screen, for example waves, birds flapping their wings,
drawing graphs might require other techniques. 

Generally speaking you will 

- Move and tranform objects on the screen.
    - Imagine objects sliding, rotating, scaling, and fading.
- Draw an object.
    - Imagine lines be being drawn, and shapes that morph. 
- Cycle through frames or video.
    - Imagine complex shapes like characters or detailed objects. 

- Motion: Slide, Fade
    - These can with view properties
        - center, x and y
        - frame, x, y, width, and height
        - bounds, x, y, width, and height
            - In most cases you will not want to animate bounds!
        - alpha 
        - backgroundColor
- Motion: Rotation and Scale 
    - Use CGAffineTransform with this you can scale, rotate, and translate an object. If you are 
    animating an object and need 
    

## UIView Animation

UIView provides a helper method that makes it easy to create simple aniamtions. Using UIview.animate()
Is the easiest way to create animation. This doesn't allow you to animate every property but it does
cover all of the most common things you will want to animate. This is a tool you can grab at any time
make something slide, fade, rotate or scale into view. 

UIView.animate() is a high level tool that exposes a few options, and presents any easy to access
API. That said UIView.animate() has some limits. 

Limited to these properties: 

- frame: Modify this property to change the view’s size and position relative to its superview’s coordinate system. (If the transform property does not contain the identity transform, modify the bounds or center properties instead.)
- bounds: Modify this property to change the view’s size.
- center: Modify this property to change the view’s position relative to its superview’s coordinate system.
- alpha: Modify this property to gradually change the transparency of the view.
- backgroundColor: Modify this property to change the view’s background color.
- contentStretch: Modify this property to change the way the view’s contents are stretched to fill the available space.
- transform: Modify this property to scale, rotate, or translate the view relative to its center point. Transformations using this property are always performed in 2D space. (To perform 3D transformations, you must animate the view’s layer object using Core Animation.)

**Constraints** views that use constraints present an intersting problem. Constraints are a system 
that automatically set the size and position of an object on the screen. What happens when another 
system tries to position that object somewhere else? This can be a problem. When you need to 
animate an object tat has constraints applied to it there a couple strategies you can consider: 

- Animate the constraint rather than the object! 
- Don't use constraints, size and position your object programatically. 

### UIView.animate() Examples 

> An example of UIView.animate()

### UIView.animate() Challenges 

> A series of animated gifs or an Xcode project that illustrates an example

## UIViewPropertyAnimator



## CABasicAnimation 

If you can't animate a property with UIView.animate() you can probably animate it with 
CABasicAnimation. 

## Challenges 

- Make a loading screen
- Make a landscape
- Animate a progress bar
- 

