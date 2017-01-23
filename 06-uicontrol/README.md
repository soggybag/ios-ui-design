# UIControl
 
UIControl is a class that implements common behavior used for UI controls. All of hte built in 
UI controls, like UIButton, UISwitch, UISegmentedControl, etc. subclass UIControl. Here is what 
Apple has to say about UIControl. Take a few minutes to read this. 

- https://developer.apple.com/reference/uikit/uicontrol

## Target Action pattern

Controls use the target action pattern. In short this pattern allows controls to send messages 
to a parent view when the control changes state, changes value, is activated, deactivated, or 
manipulated in any way. 

The target action pattern is similar to the observer or event listener patterns used elsewhere. 

All of the built in built controls use this, and the controls you create can use it also. 

The best way to understand target action is to try it out. 

Create a UISwitch in code: 

`let lightSwitch = UISwitch()`

Add this as a child object, and position it on the screen. 

If you had created this in storyboard you would create an IBAction to handle changes. Since you 
created this with code you will handle changes with the target action pattern. 

Add a target:

`s.addTarget(self, action: #selector(switchChanged(sender:)), for: .valueChanged)`

Define the selector: 

```    
func switchChanged(sender: UISwitch) {
    print(sender.isOn)
}
```

When the switch changes state it issues a valueChanged message to all of it's targets. In other
languages you might rephrase that as the switch sends an event to all of it's listeners. 

## Subclass UIControl


## UIResponder


## UIControl or UIRepsonder?


## Making your own UI elements




