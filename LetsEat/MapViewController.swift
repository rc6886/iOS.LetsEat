//
//  MapViewController.swift
//  LetsEat
//
//  Created by Rodney Coleman on 2/24/17.
//  Copyright © 2017 Rodney Coleman. All rights reserved.
//

import UIKit
import MapKit

class MapViewController: UIViewController {
    @IBOutlet var mapView: MKMapView!
    let manager = MapDataManager()
    var selectedRestaurant: RestaurantItem?
    
    override func viewDidLoad() {
        super.viewDidLoad()

        initialize()
    }
    
    func initialize() {
        mapView.delegate = self
        manager.fetch(completion: {(annotations) in
            addMap(annotations)
        })
    }
    
    func addMap(_ annotations: [RestaurantAnnotation]) {
        mapView.setRegion(manager.currentRegion(latDelta: 0.5, longDelta: 0.5), animated: true)
        mapView.addAnnotations(annotations)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        switch segue.identifier! {
        case Segue.showDetail.rawValue:
            showRestaurantDetail(segue: segue)
        default:
            print("Segue not added")
        }
    }
    
    func showRestaurantDetail(segue: UIStoryboardSegue) {
        if let viewController = segue.destination as? RestaurantDetailViewController, let restaurant = selectedRestaurant {
            viewController.selectedRestaurant = restaurant
        }
    }
}

extension MapViewController: MKMapViewDelegate {
    
    func mapView(_ mapView: MKMapView, viewFor annotation: MKAnnotation) -> MKAnnotationView? {
        let identifier = "custompin"
        
        guard !annotation.isKind(of: MKUserLocation.self) else {
            return nil
        }
        
        var annotationView: MKAnnotationView?
        
        if let customAnnotationView = mapView.dequeueReusableAnnotationView(withIdentifier: identifier) {
            annotationView = customAnnotationView
            annotationView?.annotation = annotation
        } else {
            let av = MKAnnotationView(annotation: annotation, reuseIdentifier: identifier)
            av.rightCalloutAccessoryView = UIButton(type: .detailDisclosure)
            annotationView = av
        }
        
        if let annotationView = annotationView {
            annotationView.canShowCallout = true
            annotationView.image = UIImage(named: "custom-annotation")
        }
        
        return annotationView
    }
    
    func mapView(_ mapView: MKMapView, annotationView view: MKAnnotationView, calloutAccessoryControlTapped control: UIControl) {
        guard let annotation = mapView.selectedAnnotations.first else { return }
        let data = annotation as! RestaurantAnnotation
        selectedRestaurant = data.restaurantItem
        
        self.performSegue(withIdentifier: Segue.showDetail.rawValue, sender: self)
    }
}
