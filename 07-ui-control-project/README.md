# UI Control project 

The next project you work on will be a User Interface (UI) element of your own design. You will 
design, code, and contribute your work to an open source project. 

The *goal of the project* is to create collection of useful UI elements that will help you and other 
developers make better looking apps faster. *Your goal* is to learn about designing UI elements that 
provide maximum use and flexibility and the tools required to do this.

From the perspective that the UI element you design will see a wide variety use cases
you will need to provide a wider and more flexible solution than you would normally shoot for.
Below are a list of some of the tools and concepts you should think about: 

- **IBDesignable**
    - Allows components to render themselves in storyboard. This will allow your component to be 
    previewed in storyboard. This makes it easy for others to setup and configure your component.
- **IBInspectable**
    - Allows properties of your component to edited in storyboard without writing any code. This
    makes it easy for others to use your component without having to write code. Combined with 
    IBDesignable your component will be quick and easy to set up. 
- **Sub classing UIView, UIControl, UIButton, UIImageView ...**
    - Choosing a subclass will allow your component to easily gain functionality in line with it's 
    proposed useage. You can sub class one of the built in UI elements to make a more useful 
    version of that element. 
- **Implementing a logical set of initializers.** 
    - To be useful in many situations your component will need the ability to be configured with 
    a range of values. Well written initializers make this intuitive and easy.  
- **Planning a sensible API for your UI component.**
    - Your component will have public properties and methods that control it's behavior. Well 
    chosen property, method, and parameter names will make your component easy to work with and 
    it's behavior intuitive.
- **Documentation** 
    - Writing documentation for your component will help explain it's operation. You can add 
    documentation that shows up in the code editor _the same as the default library_. 
    
## Write good code

Use comments, write documentation with your work, follow a consistent style. You are sharing your 
code with others it needs to be clear, and well documented. 

- Follow the style guide here:
    - https://github.com/raywenderlich/swift-style-guide
- Write documentation (this might not be what you think) read the following:
    - http://nshipster.com/swift-documentation/
    
## Working with Github

You'll submit your work via Github. Follow the instructions here: 

- https://github.com/MakeSchool-18/Tweet-Generator

## Choosing a UI component to create

Choose one of the UI elements from the list below, or invent one of your own. Your component should 
be easy to use, and configurable. It should be able to instantiate from code, and from storyboard. 
It should provide options to configure it's use and appearance, and instantiate itself with sensible 
default values with minimal input.

You must submit something by the end of the quarter!

Your component might have any of the features below.

- Animates
    - Animation Speed
- Colors
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
    - Make custom button with features that are not present in UIButton
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
    - Besides keeping time this could be used to display the time of an event or ?
    - Could also be a timer to keep track of time for another feature of an app. 
- Compass
    - Thing that points in a direction. Not sure this could be useful in some way. Maybe with maps?
    
## Challenges 

- Define your UI component. Describe what it is you intend to make. 
    - Add it to the MakeSchool-18 repo here: https://github.com/MakeSchool-18/ui-components 
    - Make a folder with a README that includes your description. 
- Make a UI Component
- Sub class one of the built in UI components
- Comment your code
- Include documentation

