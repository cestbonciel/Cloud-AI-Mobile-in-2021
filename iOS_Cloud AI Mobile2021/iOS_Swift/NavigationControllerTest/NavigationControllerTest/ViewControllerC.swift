//
//  ViewControllerC.swift
//  NavigationControllerTest
//
//  Created by Seohyun Kim on 2023/08/28.
//

import UIKit

class ViewControllerC: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    

	@IBAction func actBack(_ sender: Any) {
		self.navigationController?.popViewController(animated: true)
	}
	
	@IBAction func actToRootView(_ sender: Any) {
		self.navigationController?.popToRootViewController(animated: true)
	}
	@IBAction func actPopTo(_ sender: Any) {
		guard let vcs = self.navigationController?.viewControllers else { return }
		for viewcontroller in vcs {
			if let vc = viewcontroller as? ViewControllerB {
				self.navigationController?.popToViewController(vc, animated: true)
			}
		}
	}
	
	@IBAction func actToOrange(_ sender: Any) {
		if let orangeVC = self.storyboard?.instantiateViewController(identifier: "Orange") {
			self.navigationController?.pushViewController(orangeVC, animated: true)
		}
	}
	
	
}
