//
//  MapaViewController.swift
//  mapas
//
//  Created by Fernando Jt on 12/4/18.
//  Copyright © 2018 Fernando Jumbo Tandazo. All rights reserved.
//

import UIKit
import MapKit
import CoreLocation

class MapaViewController: UIViewController, CLLocationManagerDelegate  {
    @IBOutlet weak var mapa: MKMapView!
    
    var manager = CLLocationManager()
    
    var latitudMapa : CLLocationDegrees!// para almacenar latitud
    var longitudMapa : CLLocationDegrees!// para almacenar longitud
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        manager.delegate = self
        
        manager.requestWhenInUseAuthorization()// permiso para acceder a la ubicacion
        manager.desiredAccuracy = kCLLocationAccuracyBest
        manager.startUpdatingLocation()
    }

    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        let localizacion = CLLocationCoordinate2D(latitude: latitudMapa, longitude: longitudMapa)
        let span = MKCoordinateSpan.init(latitudeDelta: 0.01, longitudeDelta: 0.01)// para controlar el zoom del mapa
        
        let region = MKCoordinateRegion.init(center: localizacion, span: span)
        
        self.mapa.setRegion(region, animated: true)
        self.mapa.showsUserLocation = true
    }
    
    
    

}
