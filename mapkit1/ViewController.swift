

import UIKit
import MapKit

class ViewController: UIViewController {
    
    @IBOutlet weak var mapview: MKMapView!
    override func viewDidLoad() {
        super.viewDidLoad()
        startlocation(location: CLLocation(latitude: 30.78833360
                                           , longitude: 30.99850190), distance: 10000)
        setpoint()
    }
    func startlocation(location : CLLocation , distance : CLLocationDistance){
        // da mot8yr 34an a7dd beh ely hyban 3la el 4a4a
        let region = MKCoordinateRegion(center: location.coordinate, latitudinalMeters: distance, longitudinalMeters: distance)
        mapview.setRegion(region, animated: true)
        // da mot8yr 34an a7dd beh maxcamera boundry
        let reigonofcameraview = MKCoordinateRegion(center: location.coordinate, latitudinalMeters: 1000  , longitudinalMeters: 1000)
        mapview.setCameraBoundary(MKMapView.CameraBoundary(coordinateRegion: reigonofcameraview), animated: true)
        
        // 34an a7dd el maxuim zommout
        mapview.setCameraZoomRange(MKMapView.CameraZoomRange(maxCenterCoordinateDistance: 1000), animated: true)
        
        
    }
    func setpoint(){
        let point = MKPointAnnotation()
        point.title = "there is thelocation"
        point.coordinate = CLLocationCoordinate2DMake(30.78833360, 30.99850190)
        mapview.addAnnotation(point)
    }
    
    
}

