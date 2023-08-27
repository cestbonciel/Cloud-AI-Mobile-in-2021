//
//  ViewController.swift
//  exampleViewer
//
//  Created by Seohyun Kim on 2023/08/27.
//

import UIKit

class ViewController: UIViewController {
	
	
	@IBOutlet weak var summerImageView: UIImageView!
	@IBOutlet weak var pageControl: UIPageControl!
	
	let summerArray: [String] = ["img1", "img2", "img3", "img4", "img5"]
	var index = 0
	
	override func viewDidLoad() {
		super.viewDidLoad()
		pageControl.numberOfPages = summerArray.count
		displayImage()
	}

	fileprivate func displayImage() {
		let imageName = summerArray[index]
		let image = UIImage(named: imageName)
		summerImageView.image = image
	}
	
	@IBAction func actPreviewButton(_ sender: Any) {
		index -= 1
		if (index < 0) { index = 0 }
		pageControl.currentPage = index
		displayImage()
	}
	
	@IBAction func actNextButton(_ sender: Any) {
		index += 1
		if (index > summerArray.count - 1) {
			index = summerArray.count - 1
		}
		pageControl.currentPage = index
		displayImage()
	}
	
	
}

