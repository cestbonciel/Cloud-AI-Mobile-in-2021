//
//  ViewController.swift
//  UIImagePickerController
//
//  Created by Seohyun Kim on 2023/09/05.
//

import UIKit


class ViewController: UIViewController,UIImagePickerControllerDelegate, UINavigationControllerDelegate {
	
	let imagePickerController = UIImagePickerController()
	
	@IBOutlet weak var imageView: UIImageView!
	override func viewDidLoad() {
		super.viewDidLoad()
		imagePickerController.delegate = self
	}


	
	
	private func photoUpload(action: UIAlertAction) -> () {
		imagePickerController.sourceType = .photoLibrary
		present(imagePickerController, animated: true)
	}
	
	private func cameraPicker(action: UIAlertAction) -> () {
		imagePickerController.sourceType = .camera
		present(imagePickerController, animated: true)
	}
	
	@IBAction func actCamera(_ sender: UIButton) {
		let chose = UIAlertController(title: "Photo Options", message: "앱에서 무슨 기능을 선택하시겠습니까?", preferredStyle: .actionSheet)
		let takingPicture = UIAlertAction(title: "촬영하기", style: .default, handler: cameraPicker)
		let backButton = UIAlertAction(title: "취소", style: .cancel)
		
		chose.addAction(takingPicture)
		chose.addAction(backButton)
		
		present(chose, animated: true)
		
	}
	
	func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
		
		
		
		if let image = info[.originalImage] as? UIImage {
			imageView.image = image
			UIImageWriteToSavedPhotosAlbum(image, self, #selector(savedImage), nil)

		} else if let image = info[.imageURL] as? UIImage {
			
		}
		picker.dismiss(animated: true, completion: nil)
		
		
	}

	@objc
	func savedImage(_ image: UIImage, didFinishSavingWithError error: Error?, contextInfo: UnsafeMutableRawPointer?) {
		if let error = error {
			print(error)
			return
		}
	}
	 
}
