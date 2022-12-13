//
//  MapViewController.swift
//  TpFinalSwift
//
//  Created by digital on 13/12/2022.
//

import UIKit
import MapKit

class MapViewController: UIViewController, MKMapViewDelegate {
    var userListDownloader = UserJsonDownloader()
    var userList = Users()
    var userPins = [UserPin]()
    var selectedPinUserId = 0

    @IBOutlet weak var map: MKMapView!
    override func viewDidLoad() {
        super.viewDidLoad()
        self.userListDownloader.downloadUsers(urlString: "http://jsonplaceholder.typicode.com/users") {
            self.userList = self.userListDownloader.users
            self.map.delegate = self
            
            for user in self.userList{
                if var lat = Double(user.address.geo.lat){
                    if var lng = Double(user.address.geo.lng){
                        let annotation = UserPin(title: user.name, coordinate: CLLocationCoordinate2D(latitude: CLLocationDegrees(lat), longitude: CLLocationDegrees(lng)), info: "\(user.id)", id: user.id)
                        self.userPins.append(annotation)
                    }
                }
            }
            self.map.addAnnotations(self.userPins)
        }

        // Do any additional setup after loading the view.
    }
    
    func mapView(_ mapView: MKMapView, viewFor annotation: MKAnnotation) -> MKAnnotationView? {
        // 1
        guard annotation is UserPin else { return nil }

        // 2
        let identifier = "userPin"

        // 3
        var annotationView = mapView.dequeueReusableAnnotationView(withIdentifier: identifier)

        if annotationView == nil {
            //4
            annotationView = MKPinAnnotationView(annotation: annotation, reuseIdentifier: identifier)
            annotationView?.canShowCallout = true

            // 5
            let btn = UIButton(type: .detailDisclosure)
            annotationView?.rightCalloutAccessoryView = btn
        } else {
            // 6
            annotationView?.annotation = annotation
        }

        return annotationView
    }
    
    func mapView(mapView: MKMapView!, annotationView view: MKAnnotationView!, calloutAccessoryControlTapped control: UIControl!) {
        print("clicke")
        let userPin = view.annotation as! UserPin
        let placeName = userPin.title
        let placeInfo = userPin.info
        self.selectedPinUserId = userPin.id
        performSegue(withIdentifier: "toUserGalleries2", sender: self)
    }
    

    
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
        if let id = segue.identifier{
            if id == "toUserGalleries2"{
                if let dest = segue.destination as? UserGalleriesViewController{
                    dest.userId = self.selectedPinUserId
                }
            }
        }
    }
    

}
