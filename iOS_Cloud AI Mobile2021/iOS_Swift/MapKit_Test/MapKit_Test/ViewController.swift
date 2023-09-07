//
//  ViewController.swift
//  MapKit_Test
//
//  Created by Seohyun Kim on 2023/09/07.
//

import UIKit
import MapKit

class ViewController: UIViewController, CLLocationManagerDelegate {
	@IBOutlet weak var segmentControll: UISegmentedControl!
	
	@IBOutlet weak var locationInfoLabel: UILabel!
	@IBOutlet weak var locationInfoLabel2: UILabel!
	@IBOutlet weak var mapView: MKMapView!
	
	let locationManager = CLLocationManager()
	
	override func viewDidLoad() {
		super.viewDidLoad()
		
		locationInfoLabel.text = ""
		locationInfoLabel2.text = ""
		locationManager.delegate = self
		locationManager.desiredAccuracy = kCLLocationAccuracyBest
		locationManager.requestWhenInUseAuthorization()
		locationManager.startUpdatingLocation()
		mapView.showsUserLocation = true

	}
	@IBAction func actChange(_ sender: UISegmentedControl) {
		if sender.selectedSegmentIndex == 0 {
			// 현재 위치
			// 한국 위도,경도 읽지 못함 (google maps )
			// MARK: - SAMPLE DATA (37.460190 126.440697) -인천국제공항
			// FEATURE: - CUSTOM > Location > Custom Location
			self.locationInfoLabel.text =  ""
			self.locationInfoLabel2.text = ""
			locationManager.startUpdatingLocation()
		} else if sender.selectedSegmentIndex == 1 {
			// 서울 위치
			setAnnotation(latitudeValue: 37.571617, longtitudeValue: 126.976906, delta: 1, title: "광화문", subtitle: "서울 종로구 사직로 161")
			self.locationInfoLabel.text = "보고 계신 위치"
			self.locationInfoLabel2.text = "광화문"
		} else if sender.selectedSegmentIndex == 2 {
			// Apple park 위치
			setAnnotation(latitudeValue: 37.33532336565245, longtitudeValue: -122.00880017998406, delta: 1, title: "Apple Park", subtitle: "Rainbow Stage")
			self.locationInfoLabel.text = "보고 계신 위치"
			self.locationInfoLabel2.text = "Apple Park"
			
		}
	}
	
	func goLocation(latitudeValue: CLLocationDegrees, longtitudeValue: CLLocationDegrees, delta span: Double) -> CLLocationCoordinate2D {
		let pointLocation = CLLocationCoordinate2DMake(latitudeValue, longtitudeValue)
		let spanValue = MKCoordinateSpan(latitudeDelta: span, longitudeDelta: span)
		let pointRegion = MKCoordinateRegion(center: pointLocation, span: spanValue)
		mapView.setRegion(pointRegion, animated: true)
		return pointLocation
	}
	
	func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
		let pointLocation = locations.last
		_ = goLocation(latitudeValue: (pointLocation?.coordinate.latitude)!, longtitudeValue: (pointLocation?.coordinate.longitude)!, delta: 0.01)
		CLGeocoder().reverseGeocodeLocation(pointLocation!, completionHandler: { (placemarks, error ) -> Void in
			let placeMarker = placemarks!.first
			let country = placeMarker!.country
			var address: String = country!
			if placeMarker!.locality != nil {
				address += ""
				address += placeMarker!.locality!
			}
			
			if placeMarker?.thoroughfare != nil {
				address += ""
				address += placeMarker!.thoroughfare!
			}
			
			self.locationInfoLabel.text = "현재 위치"
			self.locationInfoLabel2.text = address
		})
		
		locationManager.stopUpdatingLocation()
	}
	
	func setAnnotation(latitudeValue: CLLocationDegrees, longtitudeValue: CLLocationDegrees, delta span: Double, title stringTitle: String, subtitle stringSubtitle: String) {
		let annotation = MKPointAnnotation()
		annotation.coordinate = goLocation(latitudeValue: latitudeValue, longtitudeValue: longtitudeValue, delta: span)
		annotation.title = stringTitle
		annotation.subtitle = stringSubtitle
		mapView.addAnnotation(annotation)
		
	}
}

