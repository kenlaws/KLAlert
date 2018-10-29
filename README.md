# KLAlert

[![CI Status](https://img.shields.io/travis/kenlaws/KLAlert.svg?style=flat)](https://travis-ci.org/kenlaws/KLAlert)
[![Version](https://img.shields.io/cocoapods/v/KLAlert.svg?style=flat)](https://cocoapods.org/pods/KLAlert)
[![License](https://img.shields.io/cocoapods/l/KLAlert.svg?style=flat)](https://cocoapods.org/pods/KLAlert)
[![Platform](https://img.shields.io/cocoapods/p/KLAlert.svg?style=flat)](https://cocoapods.org/pods/KLAlert)

## Example

UIAlertController is nice and all, but it means having to write a few lines of code where before one call was often all you'd need. klAlert is a series of static functions that let you create and handle the results of a modern alert in just one call:
```	
Alert.withButtonsAndCompletion(title: "Question",
				msg: "Are you OK?",
				buttons: ["I'm OK","I'm Not OK"]) { (index) in
					if index == 0 {
						// The user is fine
					} else {
						// Help the user
					}
				}
```
## Current Version: 1.0.6
A complete restructuring. 

## Installation
### [CocoaPods](http://cocoapods.org/)

1. Add the following to your [Podfile](http://guides.cocoapods.org/using/the-podfile.html):

```
use_frameworks! #if this isn't already in your podfile
pod "KLAlert"
```
2. Run `pod install`.
3. Enjoy.

## Documentation
Until I have ample time, note that you can find at least simple examples of usage in the Demo app.
### Static Functions for the Class Alert
#### `static func withOneButton(title: String, msg: String, btn: String)`
Shows an alert with one button. There is no completion hander. It simply vanishes when the user taps the button.  
**Parameters**  
*title*: Title at top of alert  
*msg*: Explanatory alert text  
*btn*: Text for the button  

#### `static func withButtonsAndCompletion(title: String?, msg: String, buttons: [String], handler: @escaping (_ result: Int) -> ())`
Shows an alert with one or more buttons. After a tap, it runs the completion handler using an index to indicate which button the user pressed. Buttons are displayed from top to bottom.  
**Parameters**  
*title?*: Title at top of alert (optional)
*msg*: Explanatory alert text  
*buttons*: An array of strings for the button titles  
*handler*: closure with an Int indicating which button was tapped (0..<n buttons)  

#### `static func asAPopupWithCompletion(source: UIView?, title: String?, msg: String?, cancel: String?, buttons: [String], handler: @escaping (_ result: Int) -> ())`
Shows a popup alert with a number of buttons, runs the completion handler once the user makes a choice and returns the index of the tapped button (cancel = 0.) 
**Parameters**  
*source?*: The view from which the popover emanates (REQUIRED if presented on an iPad, otherwise optional)  
*title?*: Large title at top of alert (optional)
*msg?*: Small subtitle. (optional)
*cancel?*: Text for the "Cancel" button (optional)
*buttons*: Array of Strings with button titles  
*handler*: closure with an Int indicating which button was tapped (cancel = 0, btn1 = 1...)  


## Author

kenlaws, ken@kenlaws.com

## License

KLAlert is available under the MIT license. See the LICENSE file for more info.
