

import UIKit
import MapKit
import CoreLocation

class mapkit2ViewController: UIViewController , CLLocationManagerDelegate  {
    var locationmanager = CLLocationManager()
    
    @IBOutlet weak var mapview1: MKMapView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        locationmanager.delegate = self
        locationmanager.desiredAccuracy = kCLLocationAccuracyBest
        
        if  islocationareaenable() {
            checkautorized()
            
            
            
        }else{
            showalert(msg: "not enable to use location please open taht ")
            
        }
        


    }
   
    func checkautorized(){
        switch locationmanager.authorizationStatus {
        case .notDetermined:
            locationmanager.requestAlwaysAuthorization()
            break
        case .denied:
            showalert(msg: "please open location acess to use this app")
            break
        case .authorizedWhenInUse:
            locationmanager.requestAlwaysAuthorization()
            locationmanager.startUpdatingLocation()
            mapview1.showsUserLocation = true
            break
        case .authorizedAlways:
            locationmanager.requestAlwaysAuthorization()
            mapview1.showsUserLocation = true
            break
        default:
            break
            
        }
       
      
    }
    func islocationareaenable()  ->Bool{
        return CLLocationManager.locationServicesEnabled()
    }
    func showalert(msg : String){
        let alert = UIAlertController(title: "titile", message: msg, preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "close", style: .default))
        present (alert , animated: true , completion: nil)
    }
    func locationManager(_ manager: CLLocationManager, didChangeAuthorization status: CLAuthorizationStatus) {
        switch status {
        case .authorizedWhenInUse:
            locationmanager.requestAlwaysAuthorization()
            locationmanager.startUpdatingLocation()
            mapview1.showsUserLocation = true
            break
        case .authorizedAlways:
            locationmanager.requestAlwaysAuthorization()
            mapview1.showsUserLocation = true
            break
        case .denied:
            showalert(msg: "please open location acess to use this app")
            break
            
            
            
        case .notDetermined:
            break
        case .restricted:
            break
        @unknown default:
            break
        }
    }
    
    
    
    
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        if let location = locations.last{
            print ("location \(location)")
            zommuserlocation(location: location)
            
            
            
            
        }
    }
    func zommuserlocation(location :CLLocation){
        let region = MKCoordinateRegion(center: location.coordinate, latitudinalMeters: 500, longitudinalMeters: 500)
        mapview1.setRegion(region, animated: true)
    }
}
    

