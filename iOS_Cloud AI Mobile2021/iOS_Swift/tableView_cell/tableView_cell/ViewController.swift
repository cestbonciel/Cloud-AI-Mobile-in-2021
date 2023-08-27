//
//  ViewController.swift
//  tableView_cell
//
//  Created by Seohyun Kim on 2023/08/27.
//

import UIKit

class ViewController: UIViewController,UITableViewDataSource {

	

	@IBOutlet weak var tableView: UITableView!
	let newjeans = [["name":"해린","image":"nj1"],
					["name":"혜인","image":"nj2"],
					["name":"다니엘","image":"nj3"],
					["name":"민지","image":"nj4"],
					["name":"하니","image":"nj5"]]
	override func viewDidLoad() {
		super.viewDidLoad()
		tableView.dataSource = self
	}

	func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
		return newjeans.count
	}
	
	func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
		let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
		let dictionaryNewjeans = newjeans[indexPath.row]
		cell.textLabel?.text = dictionaryNewjeans["name"]
		if let image = dictionaryNewjeans["image"] {
			cell.imageView?.image = UIImage(named: image)
		}
		cell.detailTextLabel?.text = "\(indexPath.row + 1)번째 멤버"
		return cell
	}
	
	

}

