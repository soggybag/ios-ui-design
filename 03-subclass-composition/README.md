# Subclassing and Composition

When one object owns another object we call it composition. When a class
declares another class as it's super class we call that inheritance.
Swift also offers protocols and protocol extensions as a thrid option. 

These are three methods you will use to built more complex systems from smaller
less complex systems.

Each of these two has it's place. Inheritance tends to sound like the right
way to do things. Object oriented programming is built on inheritance.

In practice composition is easier and more flexible. The saying "Favor composition over inheritance"
Gets it own wikipedia page:

https://en.wikipedia.org/wiki/Composition_over_inheritance

## Inheritance/Subclass

This is classic OOP. It's baked into UIKit. You will use this to get at most of the basic 
functionality of core UIKit classes like:

- UIViewController
- UIView
- UIControl
- CALayer

To go even further some classes must be subclassed, they can not be instantiated directly. The only
way to create an instance is by defining a subclass. 

## Tutorial 

Follow the tutorial here: 

- https://github.com/soggybag/swift-inheritance

## Thoughts 

OOP is a requirement to work UIKit. Many classes are meant to be subclassed. Subclassing works well 
for adding core functionality to objects. Subclassing has the limitation that a class may 
inherit from only one super class. As features become more granular inheritance becomes less 
advantagous. The playground examples illustrate this. 

Protocols and Protocol extensions work well for composing functionality from multiple 
sources. A limit of protocol extensions is they may not contain stored properties. That is you 
can't add a new property to a class with a protocol extension. 

Let's sum that up. 

- You will need to subclass some UIKit's default classes. 
- If you can add functionality through methods alone protocol extensions will work. 
- If you need to add a property you will have to subclass. 

**Some Strategies**

If you need to add features to existing components. This might be utility functions that you find 
you need in several views or need to apply to UI classes like  UIButton, UILabel, UIView etc. 
you can write an extension. Some examples: 

- Adding validation functions for text input. 
- Helper functions that perform calculations. 
- Generative functions that generate preconfigured objects. 

If you are creating a new UI element. If it is close in functionality to an extisting UI element, 
you subclass the existing element and gain all of it's functionality. Some examples: 

- UI elements, views, buttons, labels etc. that have a customized display. 
- You are creating a new UI element, subclass UIView or UIControl. 

Complex UI elements are best created by composing several objects. For example, a custom 
nav bar might start as a subclass of UIView. It might also have subviews that are UILabels, 
UIButtons, and other objects. 

After some practice you will find yourself combing all of these ideas. 


