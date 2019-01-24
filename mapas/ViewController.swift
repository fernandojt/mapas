//
//  ViewController.swift
//  mapas
//
//  Created by Fernando Jt on 11/4/18.
//  Copyright © 2018 Fernando Jumbo Tandazo. All rights reserved.
//

import UIKit
import MapKit

class ViewController: UIViewController, UISearchBarDelegate{
    
    @IBOutlet var buscador: UISearchBar!
    @IBOutlet weak var mapa: MKMapView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        buscador.delegate = self
    }

    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
        buscador.resignFirstResponder() // para quitar el teclado al momento de dar enter
        
        let geocoder = CLGeocoder()
        geocoder.geocodeAddressString(buscador.text!) { (places:[CLPlacemark]? ,error:Error?) in
            if error == nil {
                
                let place = places?.first
                let anotacion = MKPointAnnotation()
                anotacion.coordinate = (place?.location?.coordinate)!
                anotacion.title = self.buscador.text
                
                let span = MKCoordinateSpan.init(latitudeDelta: 0.10, longitudeDelta: 0.10)// para controlar el zoom del mapa
                
                let region = MKCoordinateRegion(center: anotacion.coordinate, span: span)
                
                self.mapa.setRegion(region, animated: true)
                self.mapa.addAnnotation(anotacion)
                self.mapa.selectAnnotation(anotacion, animated: true)
                
                
            }else {
                print("hubo un error")
            }
            }
    }


}

