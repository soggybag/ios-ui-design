# UIBezierPath

UIBezierPath lets you create paths that can be used to draw images and animate objects. A path 
consists of straight and curved line segments and is exactly the same as lines you might draw 
with Sketch. The difference only difference between the two is lines drawn with UIBezierPath 
need to be described in code. 

UIBezier path only defines the "geometry" of the path or the path isself not the drawing or 
stroke and fill you might create from the path. 

CAShapeLayer is a layer specialize for rendering a path. Attach a path to a shapelayer's `path`
property. Then set these properties to render the path into the layer. 

- lineWidth
- strokeColor
- strokeStart
- strokeEnd
- fillColor

See the videos here for a short tutorial on UIBezierPath: 

- https://www.youtube.com/watch?v=9UfcBudmrGI&index=17&list=PLoN_ejT35AEhGkIbBFjn6ACfNfIyQa4Od

Also see the tutorials in this folder. 

## Resources

- https://developer.apple.com/reference/uikit/uibezierpath
- https://developer.apple.com/reference/quartzcore/cashapelayer
- https://developer.apple.com/reference/quartzcore/cagradientlayer

## Challenges

- Draw a circle with a fill and stroke
- Draw a rectangle
- Draw a circle with a gradient fill
- Use the ideas from the tutorial to work on your challenge project. 




