

import UIKit
import Eureka
import CoreLocation
import Alamofire
import SwiftyJSON

class MatchRegViewController: FormViewController, CLLocationManagerDelegate{
    
    @IBAction func cancelButton(_ sender: UIBarButtonItem) {
        self.dismiss(animated: true, completion: nil)
    }
    let manager = CLLocationManager()
    var latitude:Double = 0.0
    var longitude:Double = 0.0
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        let userLocation = locations[0]
        let myLocation = CLLocationCoordinate2D(latitude: userLocation.coordinate.latitude, longitude: userLocation.coordinate.longitude)
        self.latitude = myLocation.latitude
        self.longitude = myLocation.longitude
    }
    
    @IBAction func createEventButton(_ sender: UIBarButtonItem) {
        //let eventRegEndPoint = "https://fast-forest-67021.herokuapp.com/api/events/"
        let valuesDictionary = form.values()
        let position = valuesDictionary["locationRowTag"] as! CLLocation
        let name = valuesDictionary["rowNameTag"] as! String
        let address = valuesDictionary["rowAddressTag"] as! String
        print(position)
        let longitude = position.coordinate.longitude
        let latitude = position.coordinate.latitude
        let parameters: Parameters = [
            "name": name,
            "players": 21,
            "longitude": String(longitude),
            "latitude": String(latitude),
            "status": "active",
            "score": 5,
            "address": address,
            "date_start": "2015-11-30T22:58:00Z",
            "date_finish": "2015-11-30T22:58:00Z",
            "description": "desc",
            "sport": 3,
            "owner": 1        ]
        Alamofire.request("https://fast-forest-67021.herokuapp.com/api/events/", method: .post, parameters: parameters, encoding: JSONEncoding.default) // encoding defaults to `URLEncoding.default`
 self.dismiss(animated: true, completion: nil)
    }

    
    override func viewDidLoad() {
        super.viewDidLoad()
        manager.delegate = self
        manager.desiredAccuracy = kCLLocationAccuracyBest
        manager.requestWhenInUseAuthorization()
        manager.startUpdatingLocation()
        var loadedSports = [String]()
        let sportsEndPoint = "https://fast-forest-67021.herokuapp.com/api/sports/"
                Alamofire.request(sportsEndPoint).responseJSON(completionHandler: {
            response in
            switch response.result {
            case .success:
                print("Everything is OK")
                let jsonObject = JSON(response.result.value!)
                if let sports = jsonObject.array {
                    for sport in sports{
                        let plsEndThisNightmare = sport["name"].string
                        loadedSports.append(plsEndThisNightmare!)
                    }
                    
                    
                }
                self.form
                    
                    
                    +++ Section("Datos del evento")
                    <<< ActionSheetRow<String>() {
                        $0.tag = "SportNameTag"
                        $0.title = "Deporte"
                        $0.selectorTitle = "Escoge un deporte"
                        $0.options = loadedSports
                        
                        // initially selected
                        }
                    <<< TextRow(){ row_name in
                        row_name.tag = "rowNameTag"
                        row_name.title = "Nombre del evento"
                        row_name.placeholder = "Pinchanga UPC"
                    }
                    <<< IntRow(){ row_qPlayers in
                        row_qPlayers.tag = "rowQPlayerTag"
                        row_qPlayers.title = "Numero de jugadores"
                        row_qPlayers.placeholder = "Ej. 21"
                        
                    }
                   
                    <<< TextRow(){ row_address in
                        row_address.tag = "rowAddressTag"
                        row_address.title = "Dirección"
                        row_address.placeholder = "Ej. Campo marte"
                    }
                    <<< DateRow(){
                        $0.tag = "dateRowTag"
                        $0.title = "Fecha del evento"
                        $0.value = Date(timeIntervalSinceReferenceDate: 0)
                    }
                    
                    <<< LocationRow(){
                    $0.tag = "locationRowTag"
                        $0.title = "LocationRow"
                        $0.value = CLLocation(latitude: self.latitude, longitude: self.longitude)
                    }
                    +++ Section("Descripción")
                    <<< TextAreaRow(){ row_description in
                        row_description.tag = "rowDescTag"
                        row_description.title = "Descripción"
                        row_description.placeholder = "Ej. Apuesta 5so por cabeza muchachos :v"
                        
                    
                }
                
                
            case .failure(let error):
                print("\(error)")
            }
        })

        print(loadedSports)
        
        
    }
    func loadSports(){
      
    }
  
    }

