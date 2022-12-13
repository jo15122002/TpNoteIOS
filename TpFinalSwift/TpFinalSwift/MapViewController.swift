//
//  MapViewController.swift
//  TpFinalSwift
//
//  Created by digital on 13/12/2022.
//

import UIKit
import MapKit

class MapViewController: UIViewController {
    var userListDownloader = UserJsonDownloader()
    var userList = Users()

    @IBOutlet weak var map: MKMapView!
    override func viewDidLoad() {
        super.viewDidLoad()
        self.userListDownloader.downloadUsers(urlString: "http://jsonplaceholder.typicode.com/users") {
            self.userList = self.userListDownloader.users
            
            for user in self.userList{
                if var lat = Double(user.address.geo.lat){
                    if var lng = Double(user.address.geo.lng){
                        let annotation = MKPointAnnotation()
                        annotation.coordinate = CLLocationCoordinate2D(latitude: CLLocationDegrees(lat), longitude: CLLocationDegrees(lng))
                        self.map.addAnnotation(annotation)
                    }
                }
            }
        }

        // Do any additional setup after loading the view.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
