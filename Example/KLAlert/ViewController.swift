//
//  ViewController.swift
//  KLAlert
//
//  Created by kenlaws on 10/28/2018.
//  Copyright (c) 2018 kenlaws. All rights reserved.
//

import UIKit
import klAlert

class ViewController: UIViewController {

	@IBOutlet weak var confirmBtn:UIButton!
	@IBOutlet weak var colorBtn:UIButton!
	@IBOutlet weak var popupBtn:UIButton!

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }


	@IBAction func handleOneBtnAlert() {
		Alert.withOneButton(title: "One Button Alert",
							msg: "This is a simple one-button alert with no completion handler.",
							btn: "OK")
	}


	@IBAction func handleTwoBtnAlert() {
		Alert.withButtonsAndCompletion(title: "Confirmation",
									   msg: "Here's a sample to confirm an action. The completion handler gets 1 for OK, 0 for Cancel.",
									   cancel: "Cancel",
									   buttons: ["OK"]) { (result) in
										guard result == 1 else { return }
										
										var transform = CATransform3DIdentity
										let anim = UIViewPropertyAnimator(duration: 1.0, curve: .easeInOut)
										anim.addAnimations({
											transform = CATransform3DRotate(transform, 180 * CGFloat.pi / 180, 0, 0, 1)
											self.confirmBtn.layer.transform = transform
										}, delayFactor: 0.0)
										anim.addAnimations({
											transform = CATransform3DRotate(transform, -180 * CGFloat.pi / 180, 0, 0, 1)
											self.confirmBtn.layer.transform = transform
										}, delayFactor: 0.5)
										anim.startAnimation()
										
		}
	}


	@IBAction func handleThreeBtnAlert() {
		Alert.withButtonsAndCompletion(title: "Multiple Buttons",
									   msg: "Here's a sample with multiple buttons. The completion handler gets an index indicating which button was pressed.",
									   cancel: "Cancel",
									   buttons: ["Red","Green","Blue"]) { (color) in
										// We'll let 0 - Cancel just fall through.
										switch color {
										case 1:
											self.colorBtn.backgroundColor = UIColor.red
										case 2:
											self.colorBtn.backgroundColor = UIColor.green
										case 3:
											self.colorBtn.backgroundColor = UIColor.blue
										default:
											break
										}
		}
	}


	@IBAction func handlePopupAlert() {
		Alert.asAPopupWithCompletion(source:popupBtn,
									 title: "Popup Alert",
									 msg: "This is a popup on iPhones and a popover on iPads. The completion handler gets an index indicating which button was pressed.",
									 cancel: "Cancel",
									 buttons: ["Red","Green","Blue"]) { (color) in
										// We'll let 0 - Cancel just fall through.
										switch color {
										case 1:
											self.popupBtn.backgroundColor = UIColor.red
										case 2:
											self.popupBtn.backgroundColor = UIColor.green
										case 3:
											self.popupBtn.backgroundColor = UIColor.blue
										default:
											break
										}
		}
	}




}

