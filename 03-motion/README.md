# Motion 

UIKit provides a few ways to make things move. The number and variety of options makes animation 
with UIKit a bit of a jungle. To understand animation in UIKit it helps to work through the 
available options methodically and consider why each option exists. I will try and do that here. 

First let's look at what motion is on the computer. Animation can be broken down into a few 
categories. Being able to examine a break down and identify which features are required to create
a particular effect is the first step to success. 

**Motion Graphics**

Motion graphic animation is generally where you are moving objects on the screen. In generally you 
are changing an object's center, or frame, or using a transform to rotate or scale an object. 

**Drawing - 

Here is a short reference for the tools that might apply for different types of animation. In this 
case you are drawing a shape like you are tracing a path. 

**Frame based**

This is the classic animation where you are showing a series of images one at a time like the frames 
of a movie. 

**Special Effects**

Everything else falls here. Particle systems are a good example. Particles can be used to create 
rain, stars, fairy dust, fire and more. Bluring, and other filter effects would also fall in this 
category. 

- Move and tranform objects on the screen.
    - Imagine objects sliding, rotating, scaling, and fading.
    - Use: frame, center, transform, and UIView. 
- Draw an object.
    - Imagine lines be being drawn, and shapes that morph. 
    - Use: UIBezierPath, Core Graphics, and CABasicAnimation
- Cycle through frames or video.
    - Imagine a flipbook of images each shown in succession. 
    - Use: UIImage and UIImageView, AV
- Special effects. 
    - Particles, filter effects and more. The tools used here are hard to nail down. 
    - Use: CAParticleLayer, Open GL (there is a specialized layer for this...), Blur and vibrancy 
    effects.

The section will focus on UIView.animate(). This method has a few options that allow you to animate
most to things you will want to animate. It also provides a simple interface that easy to work with. 

Here is a link to some video tutorials: 

- https://www.youtube.com/watch?v=f1OWrFO_ayQ&list=PLoN_ejT35AEhGkIbBFjn6ACfNfIyQa4Od&index=9

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

- Animate the constraint rather than the object. 
- Don't use constraints, size and position your object programatically. 

### UIView.animate() Examples 

> An example of UIView.animate()

### UIView.animate() Challenges 

- ![UIView Animate challenge 1](uiview-animation-1.gif)
- ![UIView Animate challenge 2](uiview-animation-2.gif)
- ![UIView Animate challenge 3](uiview-animation-3.gif)
- ![UIView Animate challenge 4](uiview-animation-4.gif)
- ![UIView Animate challenge 5](uiview-animation-5.gif)
    - This last example was created by anmating only the frame property! I almost exclusively used
    CGRect methods: insetBy() and offsetBy().

## Project Challenge

Take the ideas here and apply them to an iOS project you are working on. There several places you 
can make use of these ideas. A good strategy is not to be overly abitious in what you want to 
accomplish at first. Use this as an opportunity to explore new tools. 



- Animate the elements one or more view controller screens. Animate the content elements into view
one at a time. You can use the order you'd like your users to recognize them. This can help 
people understand how to use the screen.
    - Choose a view controller and animate each of the elements onto the screen. 
- Create an onboarding animation.
    - Use UIpageViewController to create instructions or onboarding for an existing app. 
    - Animate the elements on each "page". 
- Try and recreate an animation from an app or design you've seen or used. start simple. We haven't 
covered all of the available techniques for drawing and animation yet, so somethings may not be 
possible with UIView.animate() alone. Stick with tools we have covered so far:
    - CALayer, and CAGradient layer. Use these for adding borders, rounding corners, and adding
    gradients
    - UIView.animate(), stick to the properties covered so far: 
        - frame, bounds, center - move size and position
        - backgroundColor - color
        - alpha - transparency
        - transform - rotate, scale, and translate (move)

Notes: Understanding how to recreate how to recreate animations you have found require understanding
what tools are available and the tools can do. 

- UIView
    - The top level element for display. 
- Layers
    - CALayer is a lower level element that is where drawings are stored. 
    - There are several specialized layers 
        - CAShapeLayer : A layer that draws a path with a stroke and a fill. You can animate the 
        drawing of the path. 
        - CAGradientLayer : A Layer that draws a gradient. 
        - CAEmitterLayer : renders animated particle systems. These can produce a wide range of 
        effects made of many small moving images. Use this for fire, smoke, rain, fairy dust etc. 
        - CAReplicatorLayer : A layer that creates copies of sublayers transformed and offset. 
        Imagine the layer objects copied and animated. 
        - CAScrollLayer : A layer specialized to scroll content larger than it's bounds. 
        - CATiledLayer : This is a layer specialized to draw large content that might cahced at 
        multiple leveles of detail. For instance the map view. 
    - For even more control look into 
        - CAEAGLLayer : A layer that supports OpenGL content. 
        - CAMetalLayer : A layer that supports low level GPU-accelerated 3d graphics. 
- UIBezierPath
    - Draw a path with curves and straght lines. You can create object of any shape with stroke and 
    fill. Think about drawing with Sketch, then imagine doing it in code. 
- UIView.animate()
    - Use this first. If you can animate something with this tool do it! It's easy flexible and 
    efficient. 
- CABasicAnimation
    - Reach for this tool when you need to animate properties/features that are not supported by 
    UIView.animate(). It's more work to use CABasicAnimation but you can animate just about any 
    property. 
    
Some samples: 

- Slide, fade, rotate, scale
    - https://www.pinterest.com/mitchellhudson/ui-animation-slide-fade-rotate-scale/
- Drawing 
    - https://www.pinterest.com/mitchellhudson/ui-animation-draw/
- Special Effects 
    - https://www.pinterest.com/mitchellhudson/ui-animation-special-effects/
    
    
    
    