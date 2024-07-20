//
//  searchViewController.swift
//  mapkit1
//
//  Created by My Computer on 08/07/2024.
//

import UIKit
import MapKit

class searchViewController: UIViewController {

    @IBOutlet weak var mapview: MKMapView!
    @IBOutlet weak var lbltext: UITextField!
    override func viewDidLoad() {
        super.viewDidLoad()

      
    }
    

    @IBAction func butonsearch(_ sender: Any) {
        if lbltext.text != ""{
            searchforplace(destination: lbltext.text!)
            
        }
        else{
            showalert(msg: "you dont enter any place")

            
        }
            
    }
    func showalert(msg:String){
        let alert = UIAlertController(title: "title", message: msg, preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "cancel", style: .default, handler: nil))
    }
    func searchforplace(destination : String){
        let geocoder = CLGeocoder()
        geocoder.geocodeAddressString(lbltext.text!) { places, erorr in
           
            if let place = places?.first , erorr == nil {
                if  let location = place.location{
                    let region = MKCoordinateRegion(center: location.coordinate, latitudinalMeters: 50000, longitudinalMeters: 50000)
                    self.mapview.setRegion(region, animated: true)
                    let pin = MKPointAnnotation()
                    pin.coordinate = location.coordinate
                    self.mapview.addAnnotation(pin)
                }
                else{
                    return
                }
                
                
            }else{
                return
                
            }
            
        }
        
    }

}
