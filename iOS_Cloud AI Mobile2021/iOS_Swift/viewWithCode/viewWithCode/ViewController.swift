//
//  ViewController.swift
//  viewWithCode
//
//  Created by Seohyun Kim on 2023/08/27.
//

import UIKit

class ViewController: UIViewController {
	
	override func viewDidLoad() {
		super.viewDidLoad()
		let view1 = UIView()
		view1.frame = CGRect(x:120, y: 200, width: 220, height: 150)
		view1.backgroundColor = .systemBlue
		view.addSubview(view1)
		
		let view2 = CGRect(x: 30, y: 25, width: 160, height: 100)
		let label1 = UILabel(frame: view2)
		label1.backgroundColor = .systemGray6
		label1.text = "Hello iPhone11 User"
		
		label1.font = UIFont(name: "Apple SD Gothic Neo", size: 18)
		view1.addSubview(label1)
	}


}

