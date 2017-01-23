# Interaction with Views

UIRepsonder is a class that defines a system for objects to respond to touch events. 
UIView is a subclass of UIRepsonder. 

## Touch Events 

At the base touches are handled by four events: 

- `touchesBegan(_:with:)` Occurs when your finger makes contact with the screen.
- `touchesMoved(_:with:)` Occure continuosly as your finger moves across the screen.
- `touchesEnded(_:with:)`  Occurs when your finger breaks contact with the screen. 
- `touchesCanceled(_:with:)` Occurs when a system event cancels a touch.  

These four events make up all touch interaction. Gestures abstract these four events into 
more complex interaction. For example a long press gesture begins with a touchesBegan, measuring
the distance moved and length of the press on touchesEnded to determine if the interaction 
qualifies as a long press. 

## What to do with touch events

There are a few things you may want to do with a touch event:

- Find the location of the touch.
- Measure the distance between the start and end of a touch.
- How long did the touch last

From this info you can generate all of the archtype touch interactions. For example:

- Tap: touch begins and ends within a short distance of where it began. 
    - multi-tap: gesture also measures the time between each of a series of touches. 
- Pan: measures the distance between the start and end of a touch, apply some math to detemrine of the 
this distance is mostly along the vertical or horizontal axis. 

The UIGestureRecognizer class abstracts the four basic touch events into complex gestures. Where
possible you should use these rather than reinvent the wheel, while knowing that you can access
touch events directly if needed. 

## UITouch 

The four basic touch events are written like this: 

```
override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
    
}

override func touchesMoved(_ touches: Set<UITouch>, with event: UIEvent?) {
    
}

override func touchesEnded(_ touches: Set<UITouch>, with event: UIEvent?) {
    
}
```

These events all receive `touches: Set<UITouch>`. This is Set of UITouch objects. A Set is an 
unordered Collection of objects. All elements in a Set must be unique there will never be two 
inistances of the same element in a Set. 

How would you work with a these? Here are a few examples: 

You want to know if there was a touch. 

```
override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
    print("Touches began!")
    // Do some touchy code here...
}
```

You want to know where a touch occured. This example uses `UITouch.location(in: UIView)`. This 
method returns a CGPoint describing coordinates of the touch. Recalling the discussion of `frame`
and `bounds` you'll remember that a views internal coordinates are not the same as the coordinates 
of it super view. Which is why this method 

```
override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
    let touch = touches.first!
    let location = touch.location(in: view)
    let rect = CGRect(origin: location, size: CGSize(width: 20, height: 20))
    let box = UIView(frame: rect)
    box.backgroundColor = UIColor.red
    view.addSubview(box)
}
```

## What to do and how to deal with multiple touches


## Challenges

- Make a track pad. 
    - Make two views that fill the upper and lower half of the screen.
    - Add a small view as a child of the upper view. 
    - Add another smaller view with circular border as a child of the lower view. 
    - Use touch events to make the small view appear and follow your finger when you touch the lower view. 
    - Make the small view in the upper view follow your finger relative to it's position in the lower view. 
    - The following properties should be used: 
        - `frame`to setup your views.
        - `bounds` to position child views in their parent.
        - `touch.location(in:)` to get the position of the touch.
        - `center` to position the small views.
        - `isHidden` use this to hide and show the small view. 

