# Initializers

Swift has a few rules that govern initialization of classes. It is important to
understand these rules when creating subclasses.

Were you ever un-sure when to set the value of a variable, or felt strange that you had to 
declare a variable with as implicitly unwrapped optional (`var foo: Int!`), or Had to use a 
`var` when you know you could use a `let` (because you had to set the value in viewDidLoad)?

Understanding Initializers will answer these questions and give you better
choices for how you setup your classes. 

## Initializers

Every class in Swift is allowed to implement one or more initializers. Swift supports two types of 
initializers:

- Designated initializers
- Convenience Initializers

### Designated initializers

A class must implement at least one designated initializer but is not limited to one. Desinated 
initializers are defined with the the keyword init alone: 

`init(name: String, id: Int)`

**A designated initializer needs to set all of the properties of a class.**

### Convenience initializers

Convenience initializers are used to make initialization more convenient. A designated initializer
needs to set all properties of a class, while a convenience initializer might contain some 
default values and allow a class to be initialized with minimal input. 

```
convenience init() {
    self.init(name: "Joe", id: 0)
    
}
```

Notice the convenience initializer starts with the keyword convenience. It also calls the designated 
initializer. A convenience intializer must call another initializer, which eventually calls a 
designated initializer. 

### Super class and initializers

A designated initializer must call a designated from it's super class. 

### Properties

In Swift all properties must have a value. Variables can not be left undefined. You must set the 
values before calling super! A variable can be nil, in this case the variable must be an optional. 

Here is an example. Imagine you have a class that represents a message. A message needs four
properties. 

- `name: String` the name of the recipient. 
- `text: String` the text of the message.
- `time: Date` the time when the message was sent.
- `received: Bool` marks whether the message was received or not.

Your class might look like this:

```
class Message {
   let name: String 
   let text: String
   let time: Date
   var received: Bool 
}
```

The example above generates an error: 

> ...failed: Initializing-properties...

`name`, `text`, `time`, and `received` do not have values!

Add an initializer. 

```
class Message {
    let name: String
    let text: String
    let time: Date
    var received: Bool
    
    init(name: String, text: String) {
        self.name = name
        self.text = text
        self.time = Date()
        self.received = false
    }
}
```

This works well, `name` and `text` come from outside and the class sets `time` and `received` 
internally. 

What if Message needs to sub class another class. Imagine we have a class named Record that is the 
base class for Messages and other types of Records. This class generates unique ids and gives it's 
subclasses an id property. 

```
class Record {
    static var count: Int = 0
    
    let id: Int
    
    init() {
        Record.count += 1
        id = Record.count
    }
}

class Message: Record {
    let name: String
    let text: String
    let time: Date
    var received: Bool
    
    init(name: String, text: String) {
        super.init()            // calling super.init()
        
        self.name = name        // <-- Error 
        self.text = text        // <-- Error 
        self.time = Date()      // <-- Error 
        self.received = false   // <-- Error 
    }
}
```

> Error ...property not initialized at super.init() call. 

This is an odd situaltion you are setting values but doing so after calling `super.init()` turns out 
to be a problem. There are a few ways you can fix this. Change the values to `var` from `let`. 

```
...
class Message: Record {
    var name: String
    var text: String
    var time: Date
    var received: Bool
...
```

Once this is done you will have to assign a value.

```
...
class Message: Record {
    var name: String = ""
    var text: String = ""
    var time: Date = Date()
    var received: Bool = false
...
```

or

```
...
class Message: Record {
    var name: String!
    var text: String!
    var time: Date!
    var received: Bool!
...
```

But this feels odd, the `name`, `time`, and `text` of a message will not change so `let` feels like 
the right thing to do. Using an unwrapped optional seems odd because you know these properties will 
all have values.

The real source of the error is calling super **before** setting property values. 

```
class Message: Record {
    let name: String
    let text: String
    let time: Date
    var received: Bool
    
    init(name: String, text: String) {
        self.name = name        
        self.text = text
        self.time = Date()
        self.received = false   // <-- Set properties before calling super!
        
        super.init()
    }
}
```

Now there are no errors! You must initialize all properties of a class before calling `super.init()`!
Here is what the Swift docs say about this: 

> Swift’s compiler performs four helpful safety-checks to make sure that two-phase initialization is 
> completed without error:
>
> **Safety check 1** A designated initializer must ensure that all of the properties introduced by its 
> class are initialized before it delegates up to a superclass initializer.

**NOTE:** You can not call **methods** of a class until after calling `super.init()`.

Where's the convenience? It's possible our program would want to set the time/date from outside. 
In this case we would need two initializers, one that included `time: Date` as a param and one without. 

```
class Message: Record {
    let name: String
    let text: String
    let time: Date
    var received: Bool
    
    init(name: String, text: String, date: Date, received: Bool) {
        self.name = name
        self.text = text
        self.time = date
        self.received = false
        
        super.init()
    }
    
    convenience init(name: String, text: String) {
        self.init(name: name, text: text, date: Date(), received: false)
    }
}
```

Here the first initializer is our **designated** initializer, and the second initilizer is our 
convenience initializer (clearly marked)!

How does this work? The designated initializer initializes all properties while the convenience 
initializer supplies default values or sets values for **convenience**. Here the convenience init
supplies default values for `time` and `received`. 

If you were to subclass Message, imagine you wanted to make a TextMessage, and EmailMessage class. 
Your subclass would] need to call `init(name: String, text: String, date: Date, received: Bool)` as
this is the **designated** initializer. 

### Calling methods from init

You can't call a class method until **after** you have called `super.init()`! I thought I'd mention 
this again because it will come up as you work and be a point of minor frustration. More on this 
topic later. 

## Making Views special

There's not much point making white boxes or standard UI buttons and labels. Really you want to 
make your UI look special and unique. A good place to start is by creating custom subclasses of 
UIView. 

Why is this a good idea? 

- Keeps code DRY, as a subclass code is easily reused.
- Keeps code organized, why clutter your view Controller with code that belongs to the View layer?

### Initializing UIView

It's time to put this into practical use. In the next you will subclass UIView. This means you 
will need to write your own initializer, and consequently call UIView's designated initializer
(`init(frame:)`).

### Overriding an initializer

When a class implements a method with the **same name and signature** as a method defined in it's 
super class we call this an **override**, initializers can have overrides. 

### Making a subclass of UIView

Start with

```
class SpecialView: UIView {
    
}
```

Imagine you want to make a UIView that appears as a red 100 by 100 point square. You also want to 
include the location but don't want to include the size since it's always 100 by 100. 

```
class SpecialView: UIView {
    
    init(location: CGPoint) {
        let size = CGSize(width: 100, height: 100)
        let rect = CGRect(origin: location, size: size)
        
        super.init(frame: rect)
        
        backgroundColor = UIColor.red
    }
    // <-- Error: Required init(code:)...
}
```

What's this an error! 

The designated initializer for UIView is `init(frame:)`. We have called this in our `init(location:)`. 

The `init?(coder aDecoder:)` is used when the class is unarchived by storyboard. Any class that can 
to be initialized by storyboard must implement this initializer. It's also a designated initializer. 

Xcode will stub this initializer in for you like: 

```
required init?(coder aDecoder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
}
```

### Initialize SpecialView in code

Make an instance of SpecialView in code: 

```
let special = SpecialView(location: CGPoint(x: 0, y: 0))
view.addSubview(special)
```

This should place a red box in the upper left corner. 

### Initialize a SpecialView from Storyboard

Create a view in Storyboard and set the class to: SpecialView. 

...

Our app crashes with an error something like: 

> fatal error: init(coder:) has not been implemented: file 
> /Users/mitchellhudson/Downloads/starter/View/SpecialView.swift, line 23

Notice this matches the line: `fatalError("init(coder:) has not been implemented")` in the
`init(coder:)` stub that Xcode gave us. We need to implement our own init code here. 

```
class SpecialView: UIView {
    
    init(location: CGPoint) {
        let size = CGSize(width: 100, height: 100)
        let rect = CGRect(origin: location, size: size)
        
        super.init(frame: rect)
        
        backgroundColor = UIColor.red
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        
        backgroundColor = UIColor.red
    }
    
}
```

Here we call a designated initializer `init(coder:)` and pass `aDecoder`. Then set the background to
red. 

This works well, if a SpecialView is created in code it's size is 100 by 100 and we can conveniently 
set it's position, and the color is red. If a SpecialView is created in Storyboard it's size and 
position are determined so we will ignore that, and just set the color to red. 

This code is not DRY. 

```
class SpecialView: UIView {
    
    init(location: CGPoint) {
        let size = CGSize(width: 100, height: 100)
        let rect = CGRect(origin: location, size: size)
        
        super.init(frame: rect)
        
        setup()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        
        setup()
    }
    
    func setup() {
        backgroundColor = UIColor.red
    }
    
}
```

This is better. Use a `setup()` method to setup an instance from any of the initializers.

## Challenges 

Try some challenges. The end goal will be to design and create your own custom UIinterface widgets. 
This will require some work the challenges here will start by builing views that draw your 
interface elements. 

- Recreate three of the previous example using a UIView subclass
    - Give each an initializer that allow features to be set as parameters of the initializer. 
    - Set up each class so that it can be initialized via Storyboard with sensible default parameters.
- Choose three of the following and design them with Sketch
    - Bargraph
    - Counter 
    - Progress bar
    - Progress spinner
    - Thermometer style graph
    - Redesign the Segemented controller
    - Custom button
    - Custom slider 
    - Custom app navbar 
    - Custom check box
    - Custom Switch
- Using your designs create the three classes that draw each of the UI elements you desinged. 
    - Don't worry about functionality yet we'll work on that later. 















--------------------------



The line: `fatalError("init(coder:) has not been implemented")` crashes you app with an error at 
this line. You need to remove this and write your own implementation for this method.  

```
class SpecialView: UIView {
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        // Called when initialized from code
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        // Called when initialized from storyboard
    }
    
}
```

For example, imagine you want to write a class that creates a view that has a default background 
color of red.

```
override init(frame: CGRect) {
    super.init(frame: frame)
    
    backgroundColor = UIColor.red
}

required init?(coder aDecoder: NSCoder) {
    super.init(coder: aDecoder)
    
    backgroundColor = UIColor.red
}
```

Now we have a class that can be initialized from code or from storyboard, and will always have a 
red background. 

You'll notice we have duplicate code `backgroundColor = UIColor.red`. This is less than ideal, 
and if this wasn't an example there would definitely be more duplicate code using this pattern. 

```
class SpecialView: UIView {
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        setup()
    }

    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        
        setup()
    }
    
    func setup() {
        backgroundColor = UIColor.red
    }
    
}
```

Here I added a setup method. This allows our class to consolidate code that ca be shared across our 
initializers. 

Now lets look at properties. Almost always your classes will need some properties. In Swift all 
properties must be initialized with a value before calling super.

Imagine our class has a property `myColor` that sets the color of the background. 

```
class SpecialView: UIView {
    
    var myColor = UIColor.red
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        setup()
    }

    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        
        setup()
    }
    
    func setup() {
        backgroundColor = UIColor.red
    }

}
```

This works since the value was set when the property was declared. 

What if the property was passed in from the initializer? We have two initializers. One of which 
will be called when initialize our class from code, and the other when the class is created from
Storyboard. 

```
class SpecialView: UIView {
    
    var myColor: UIColor
    
    init(frame: CGRect, color: UIColor = UIColor.red) {
        
        myColor = color // Has to be set before super!
        
        super.init(frame: frame)
    }
    
    override init(frame: CGRect) {
        
        myColor = UIColor.red
        
        super.init(frame: frame)
        
        setup()
    }

    required init?(coder aDecoder: NSCoder) {
        
        myColor = UIColor.red
        
        super.init(coder: aDecoder)
        
        setup()
    }
    
    func setup() {
        backgroundColor = UIColor.red
    }

}
```

Notice `myColor` is not declared with an initial value. The initial value is set in the initializers. 
The value must be set before calling super! 

This also ends up with duplicate code. 












# Subclassing UIViewController and UIView

These are built in classes that are tightly integrated with UIKit. They also work with, and can 
instantiated from Storyboard. 

## Why Subclass UIViewController?

This might sound weird you are probably creating a new view ViewController
class for every viewController you create. Which is fine but what if you
find you are duplicating code across several view controllers.

```
class ListTodosViewController: UIViewController {
  var todoStorage: Array

  func getTodos() {}
  func updateTod() {}
  func deleteTodo() {}
}
```

```
class TodoDetailViewController: UIViewController {
  var todoStorage: Array

  func getTodos() {}
  func updateTod() {}
  func deleteTodo() {}
}
```

If you find yourself doing something like this you might save some time and
energy by storing these properties and methods in super class and subclassing.

```
class TodoViewController: UIViewController {
  var todoStorage: Array

  func getTodos() {}
  func updateTod() {}
  func deleteTodo() {}
}
```

```
class ListTodosViewController: TodoViewController {

}
```

```
class TodoDetailViewController: TodoViewController {

}
```

The previous two classes are much cleaner for the refactor!

This could also be accomplished with an Extension. 

**Challenge:** Rewrite the above example with an extension. 

## Init UIViewController or UIView

UIView and UIView Controller have some special initializer requirements. 



```
class ViewController: UIViewController {
  let id: int

  init(_ coder: NSCoder? = nil, id: Int) {
    self.id = id
    if let coder = coder {
      super.init(coder: coder)
    } else {
      super.init(nibName: nil, bundle: nil)
    }
  }

  required convenience init(coder: NSCoder) {
    self.init(coder)
  }
}
```

Note! You can **not** reference `self` in a subclass until after you call
`super.init()`.

Note! You **can** call other initializers before calling `super.init()`
