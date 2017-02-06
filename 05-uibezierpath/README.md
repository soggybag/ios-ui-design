# UIBezierPath

UIBezierPath lets you create paths that can be used to draw images and animate objects. A path 
consists of straight and curved line segments and is exactly the same as lines you might draw 
with Sketch. The difference only difference between the two is lines drawn with UIBezierPath 
need to be described in code. 

UIBezier path only defines the "geometry" of the path or the path isself not the drawing or 
stroke and fill you might create from the path. 

## CAShapeLayer 

CAShapeLayer is a layer that is specialized for rendering a path. Paths can be used to draw 
lines and filled shapes, and used for animation. Paths themselves can be animated. 

Create a path with 