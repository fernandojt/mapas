//
//  CoordenadasViewController.swift
//  mapas
//
//  Created by Fernando Jt on 12/4/18.
//  Copyright © 2018 Fernando Jumbo Tandazo. All rights reserved.
//

import UIKit
import CoreLocation

class CoordenadasViewController: UIViewController, CLLocationManagerDelegate{

    @IBOutlet weak var mostrar: UILabel!
    var manager = CLLocationManager()
    
    var latitud : CLLocationDegrees!// para almacenar latitud
    var longitud : CLLocationDegrees!// para almacenar longitud
    
    override func viewDidLoad() {
        super.viewDidLoad()

        manager.delegate = self
        
        manager.requestWhenInUseAuthorization()// permiso para acceder a la ubicacion
        manager.desiredAccuracy = kCLLocationAccuracyBest
        manager.startUpdatingLocation()
    }

    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        if let location = locations.first{
            self.latitud = location.coordinate.latitude
            self.longitud = location.coordinate.longitude
        }
    }
    
    
    @IBAction func verCoordenadas(_ sender: UIButton) {
        mostrar.text = "lat: \(latitud!) long: \(longitud!)"
    }
    
    @IBAction func enviar(_ sender: UIButton) {
        
        performSegue(withIdentifier: "mapa", sender: self)
        
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "mapa"{
            if let destino = segue.destination as? MapaViewController{
                destino.latitudMapa = latitud
                destino.longitudMapa = longitud
            }
        }
    }
    
   
}
