//
//  ViewController.swift
//  KLAlert
//
//  Created by kenlaws on 10/28/2018.
//  Copyright (c) 2018 kenlaws. All rights reserved.
//

import UIKit
import KLAlert

class ViewController: UIViewController {

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


	@IBAction func handleThreeBtnAlert() {
		Alert.withButtonsAndCompletion(title: "Multiple Buttons",
									   msg: "Here's a sample with multiple buttons. The completion handler gets an index indicating which button was pressed.",
									   buttons: ["Red","Green","Blue"]) { (color) in
										switch color {
										case 0:
											self.colorBtn.backgroundColor = UIColor.red
										case 1:
											self.colorBtn.backgroundColor = UIColor.green
										case 2:
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

