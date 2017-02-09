# UI Control project 

This will be a project where you will design, code, and contribute a UI control to an open source 
project. The project is a Make School open source library of iOS controls. The goal of the project
is to collect a group of useful UI elements that will help people make better iOS apps faster. 



Choose one of the UI elements from list. Or invent one of your own. You UI element should be flexible
and provide options to set it's features. It should also provide properties and methods to control
it's appearance and behavior. Try and provide sensible and usable options through Interface builder
when it makes snese. 

Your UI element should be able to initiate through code and through storyboard. 

- Animates
    - Animation Speed
- Colors are set through the interface. 
    - Foreground color, background color stroke color, gradient colors
- Gradients 
    - Elements that use a gradient fill will need to set the angle of the gradient. 
- Size 
    - The size can be set with a method, or the size is determined by the frame of the element's 
    view. 
- property indicates if the animation is running
    - Many animated components will need to expose a property to indicate if they're animation is 
    active. 
- Can be started and stopped. 
    - Many animated components will need a property or method that starts or stops their animation. 

Choose a UI element from the list below to work on, or make up one of your own if you think of 
something that is not on the list. 

- Progress indicator
    - Create a progress indicator of your own design. It should have some or all of the follow
    features. Feel free to add more features if you think of them!
- Thermostat 
    - Draw a good thermostat. Indicates temperature or similar measurement graphically. 
- Knob or dial 
    - Design a nifty looking knob or dial. This is a UI element that rotates. 
- Buttons
    - Extend the UIButton class to add features. You can add stroke, gradient fill or an animated 
    effect when the button tapped. 
- Loading animation 
    - Think of any creative effect for a loading animation. 
        - Bonus make the effect configuable. For example rather than three bouncing circles, configure 
        the number of circles, the size and color of the circles, the speed etc. 
- Counter (has +, -, and a number)
    - This would be an element that lets a user input a number easily. Could be used for selecting 
    the number of items in a shopping cart, the number of people in your dinner party etc. 
- Toggle Switch 
    - This is button/switch with two states. An alternative to UISwitch. 
- Radio button (segmented control)
    - A group of buttons where only one can be active at any time. 
        - Bonus use a class method or singleton to make toggle buttons aware of each other.
- Slider value 
    - Create an alternative or extend UISlider. 
- Graphs and Charts. Create a view that displays data in various useful formats. To make this truly 
useful it will need to be configuarble. 
    - Bar graph
    - Line graph
    - Pie chart
- Clock
- Compass
