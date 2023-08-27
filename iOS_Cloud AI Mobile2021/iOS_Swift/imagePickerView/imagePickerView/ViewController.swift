//
//  ViewController.swift
//  imagePickerView
//
//  Created by Seohyun Kim on 2023/08/27.
//

import UIKit

class ViewController: UIViewController{
	let newjeans = ["하니", "혜인", "해린", "민지", "다니엘"]
	let njImages = ["newjeans1", "newjeans2", "newjeans3", "newjeans4", "newjeans5"]
	
	@IBOutlet weak var imagePickerView: UIPickerView!
	
	override func viewDidLoad() {
		super.viewDidLoad()
		imagePickerView.dataSource = self
		imagePickerView.delegate = self
	}


}

extension ViewController: UIPickerViewDataSource, UIPickerViewDelegate {
	func numberOfComponents(in pickerView: UIPickerView) -> Int {
		return 1
	}
	
	func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
		return newjeans.count
	}
	
	func pickerView(_ pickerView: UIPickerView, viewForRow row: Int, forComponent component: Int, reusing view: UIView?) -> UIView {
		let temp: UIImageView? = view as? UIImageView
		if let imageView = temp {
			let image = UIImage(named: njImages[row])
			imageView.image = image
			return imageView
		} else {
			let imageView = UIImageView()
			let image = UIImage(named: njImages[row])
			imageView.image = image
			imageView.contentMode = .scaleAspectFit
			return imageView
		}
	}
	
	func pickerView(_ pickerView: UIPickerView, rowHeightForComponent component: Int) -> CGFloat {
		return 200.0
	}
}
