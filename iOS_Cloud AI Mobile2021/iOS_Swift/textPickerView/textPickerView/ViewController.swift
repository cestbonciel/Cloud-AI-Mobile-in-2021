//
//  ViewController.swift
//  textPickerView
//
//  Created by Seohyun Kim on 2023/08/27.
//

import UIKit

class ViewController: UIViewController {
	let newjeans = ["민지", "다니엘", "해린", "혜인", "하니"]
	
	@IBOutlet weak var selectedName: UILabel!
	@IBOutlet weak var pickerView: UIPickerView!
	
	override func viewDidLoad() {
		super.viewDidLoad()
		pickerView.dataSource = self
		pickerView.delegate = self
	}


}

extension ViewController: UIPickerViewDataSource, UIPickerViewDelegate {
	func numberOfComponents(in pickerView: UIPickerView) -> Int {
		return 1
	}
	
	func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
		return newjeans.count
	}
	
	func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
		return newjeans[row]
	}
	
	func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
		selectedName.text = newjeans[row]
	}
}
