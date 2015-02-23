# ALButton: UIButton with some extra flavor, in Swift

### About

This control is a subclass of Apple's default UIButton. It adds some functionality, cuts the number of lines needed to customize the look and behavior of the UIButton, and makes use of some niceties of Swift. 

### How to install?

The simplest way to integrate the control to your project is to simply copy the *ALButton.swift* file to your project.

### How to use

#### Initialization

There are three ways to initialize the button

```swift
//- 1. Full Initialization

let style = ALButton.ButtonStyle()
//-- set style

let myButton = ALButton(title: "Button Title", style: style, touchUpInsideHandler: {
	(sender	) in
	
	//-- Implement touch up inside event here})

//- 2. Simple initialization with style:

var style = ALButton.ButtonStyle()
//-- set style

let myButton = ALButton(title: "Button Title", style: style)

//- 3. Short initialization

let myButton = ALButton(title: "Button Title")
```

You can also use trailing closures to initialize the button more conveniently:

```swift
//- Short Initialization

let myButton = ALButton(title: "Button Title") {
	sender in
	
	//-- Implement touch up inside event here}

//- Full Initialization

let myButton = ALButton(title: "Button Title", style: style) {
	sender in
	
	//- Implement touch up inside code here}
```

#### Adding *Touch Up Inside* handlers

You can opt not to add touch up inside handlers on the button's initialization. You can add handlers at any point using the following code: 

```swift
myButton.touchUpInside {
	sender in
	
	//-- Implement touch up inside code here}
```

#### Applying Style

To apply style to your button, you should use the *ButtonStyle* struct. With it, you can set the following properties: ``titleFont``, ``titleColor``, ``disabledTitleColor``, ``backgroundColor``, ``highlightColor``, ``disabledColor``.

You can opt to pass this style on initialization, or later, by setting the button's ``style`` property. 

### License
This component is available under the MIT license