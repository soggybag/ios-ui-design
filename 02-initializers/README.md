# Initializers

Swift has a few rules about you must initializer classes. It it important to
understand these rules especially if you creating subclasses.

Have you ever found yourself declaring variables and not sure when to set the
value, or feeling strange that you have to declare a variable with as an
implicitly unwrapped optional (var foo: Int!), or Having to use a var when you
know you could use a let but you feel you need to set the value in
viewDidLoad?

Understanding Initializers will answer these questions and give you better
choices for how you setup your classes.

1. All properties of a class MUST have a value
2. You must initialize a classes properties before calling you superclass's
Designated initializer.
4. A subclass must call the designated initializer of a Superclass.
5. Convenience initializers must call another initializer.
6. A Convenience initializer must call the designated initializer.
7. A class may have as many initializers as you care to create.

Swift supports two types of initializers:

- Designated initializers
- Convenience Initializers




# Subclassing UIViewController and UIView

There are some special considerations to understand when subclassing
UIViewController and UIView. These are core classes in UIKit. You will use
them often. They are intimately tied to the framework. These classes have
designated initializers that you are required to call on.

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

## Init UIViewController

UIViewController has some specialized initializer requirements.

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
