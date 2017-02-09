# Basic Animation project 

Take the ideas covered in class so far. Find an app with an animation that interests and inspires 
you. Your goal is recreate this. You may want, depending on the animation you choose, only recreate 
a portion of the animation. Be sure to scale this project to something managable in the available. 

Search your phone for ideas. You can also search the web: 

- https://dribbble.com/search?q=iOS+animation
- Slide, fade, rotate, scale
    - https://www.pinterest.com/mitchellhudson/ui-animation-slide-fade-rotate-scale/
- Drawing 
    - https://www.pinterest.com/mitchellhudson/ui-animation-draw/
- Special Effects 
    - https://www.pinterest.com/mitchellhudson/ui-animation-special-effects/

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
    