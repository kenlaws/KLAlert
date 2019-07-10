//
//  Alert.swift
//
//  Created by Ken Laws on 8/21/16.
//  Copyright © 2016 kenco.
//

import UIKit

let Device = UIDevice.current.userInterfaceIdiom

public class Alert {
	
	var alertWindow: UIWindow
	var controller:AlertViewController

	public init() {
		controller = AlertViewController()
		controller.view.backgroundColor = UIColor.clear

		let frame = UIApplication.shared.keyWindow?.frame ?? UIScreen.main.bounds
		alertWindow = UIWindow(frame: frame)
		alertWindow.windowLevel = UIWindow.Level.alert
		alertWindow.isOpaque = false
		alertWindow.rootViewController = controller

		alertWindow.isHidden = true
	}


	func showWindow() {
		alertWindow.isHidden = false
		controller.view.setNeedsLayout()
		controller.view.layoutIfNeeded()
	}


	func hideWindow() {
		alertWindow.isHidden = true
	}

	/**
	Shows an alert with one button. There is no completion hander. It simply vanishes when the user taps the button.

	- Parameter title: Title at top of alert
	- Parameter msg: Explanatory alert text
	- Parameter btn: Text for the button
	*/
	public func withOneButton(title: String, msg: String, btn: String) {
		let theAlert = UIAlertController(title: title, message: msg, preferredStyle: .alert)
		let defaultAction = UIAlertAction(title: btn, style: .default) { (action) -> Void in
			self.hideWindow()
		}
		theAlert.addAction(defaultAction)
		DispatchQueue.main.async {
			self.showWindow()
			self.controller.present(theAlert, animated: true, completion: nil)
		}
	}
	
	
	/**
	Shows an alert with one or more buttons. After a tap, it runs the completion handler using an index to indicate which button the user pressed. Buttons are displayed from top to bottom.

	- Parameter title?: Title at top of alert
	- Parameter msg: Explanatory alert text
	- Parameter buttons: Text for buttons
	- Parameter handler: closure with an Int indicating which button was tapped (cancel = 0, 1..n buttons)
	*/
	public func withButtons(title: String? = nil, msg: String, cancel: String? = nil, buttons: [String], handler: @escaping (_ result: Int) -> ()) {
		let theAlert = UIAlertController(title: title, message: msg, preferredStyle: .alert)
		
		if let cancel = cancel {
			let cancelAction = UIAlertAction(title: cancel, style: .cancel) { (action) -> Void in
				self.hideWindow()
				handler(0)
			}
			theAlert.addAction(cancelAction)
		}

		for (idx, title) in buttons.enumerated() {
			let action = UIAlertAction(title: title, style: .default) { (action) -> Void in
				self.hideWindow()
				handler(idx + 1)
			}
			theAlert.addAction(action)
		}

		DispatchQueue.main.async {
			self.showWindow()
			self.controller.present(theAlert, animated: true, completion: nil)
		}
	}

	
	/**
	Shows a popup alert with a number of buttons, runs the completion handler once the user makes a choice and returns the index of the tapped button (cancel = 0.)

	- Parameter source?: The view from which the popover emanates if presented on an iPad
	- Parameter title?: Large title at top of alert
	- Parameter msg?: Small subtitle. Can be nil
	- Parameter cancel?: Text for "Cancel" button
	- Parameter buttons: Array of Strings with button titles
	- Parameter handler: closure with an Int indicating which button was tapped (cancel = 0, 1..n buttons)
	*/
	public func asAPopup(source: UIView? = nil, title: String? = nil, msg: String? = nil, cancel: String? = nil, buttons: [String], handler: @escaping (_ result: Int) -> ()) {
		let theAlert = UIAlertController(title: title, message: msg, preferredStyle: .actionSheet)
		if Device == .pad {
			guard let sourceView = source else {
				print("KLAlert error: a source view is required when using a popup alert on an iPad.")
				return
			}
			theAlert.modalPresentationStyle = .popover
			theAlert.popoverPresentationController?.sourceView = sourceView
			theAlert.popoverPresentationController?.sourceRect = sourceView.bounds
		}
		
		for (idx, title) in buttons.enumerated() {
			let action = UIAlertAction(title: title, style: .default) { (action) -> Void in
				self.hideWindow()
				handler(idx + 1)
			}
			theAlert.addAction(action)
		}

		if let cancel = cancel {
			let cancelAction = UIAlertAction(title: cancel, style: .cancel) { (action) -> Void in
				self.hideWindow()
				handler(0)
			}
			theAlert.addAction(cancelAction)
		}

		DispatchQueue.main.async {
			self.showWindow()
			self.controller.present(theAlert, animated: true, completion: {
				// The popover controller actually sets the sourceView's controller as the parent,
				// so we have to get rid of our overlay window in this one case.
				if Device == .pad {
					self.hideWindow()
				}
			})
		}
	}

	
}


class AlertViewController: UIViewController {


}
