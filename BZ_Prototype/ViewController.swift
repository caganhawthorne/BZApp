//
//  ViewController.swift
//  BZ_Prototype
//
//  Created by caganhawthorne on 2/26/17.
//  Copyright © 2017 Cagan Hawthorne. All rights reserved.
//

import UIKit

import Mapbox


class ViewController: UIViewController, MGLMapViewDelegate {
    @IBOutlet var mapView: MGLMapView!
    
    let modalView = ModalViewController()
    var urlToSend: String!

    var bathroomPt: MGLPointAnnotation!
    let bathroomArray = [BathroomObj.init(latitude: 41.832167, longitude: -87.837917),
                         BathroomObj.init(latitude: 41.831583, longitude: -87.831750, description: "Family Restroom"),
                         BathroomObj.init(latitude: 41.832694, longitude: -87.830333, description: "Nursing"),
                         BathroomObj.init(latitude: 41.834611, longitude: -87.832889),
                         BathroomObj.init(latitude: 41.832250, longitude: -87.838111, description: "Family Restroom"),
                         BathroomObj.init(latitude: 41.831639, longitude: -87.832722, description: "Paid Attraction, Nursing"),
                         BathroomObj.init(latitude: 41.831889, longitude: -87.830972, description: "Paid Attraction"),
                         BathroomObj.init(latitude: 41.831000, longitude: -87.837806),
                         BathroomObj.init(latitude: 41.835861, longitude: -87.835083, description: "Family Restroom"),
                         BathroomObj.init(latitude: 41.835000, longitude: -87.833528),
                         BathroomObj.init(latitude: 41.831167, longitude: -87.834778),
                         BathroomObj.init(latitude: 41.833639, longitude: -87.830250),
                         BathroomObj.init(latitude: 41.831056, longitude: -87.833056)]
    let exhibitArray = [ExhibitObj.init(name: "Australia House", url:"https://stage.czs.org/Brookfield-ZOO/Plan-Your-Visit/Information", lat: 41.834500, long:  -87.835167)]
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        mapView.styleURL = NSURL(string: "mapbox://styles/cagan123/cj1b4753k003y2sp1jr23btht") as URL!
        mapView.delegate = self
        mapView.setCenter(CLLocationCoordinate2D(latitude: 41.832587, longitude: -87.833483), zoomLevel: 16, animated: false)
        mapView.showsUserLocation = true
    
        
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    
    @IBAction func toggleExhibitMarkers(_ sender: Any) {
        for pt in exhibitArray
        {
            if(!(pt.toggleMarkers())){
                mapView.addAnnotation(pt.exhibitPt)
            }
            else {
                mapView.removeAnnotation(pt.exhibitPt)
            }
        }
        
    }
    
    @IBAction func toggleBathroomMarkers(sender: AnyObject) {
        for pt in bathroomArray
        {
            if(!(pt.toggleMarkers())){
                mapView.addAnnotation(pt.getAnnotation())
            }
            else {
                mapView.removeAnnotation(pt.getAnnotation())
            }
        }
        
    

        
    }
    
    func mapView(_ mapView: MGLMapView, annotationCanShowCallout annotation: MGLAnnotation) -> Bool {
        // Always try to show a callout when an annotation is tapped.
        return true
    }
    func mapView(_ mapView: MGLMapView, rightCalloutAccessoryViewFor annotation: MGLAnnotation) -> UIView? {
        if (annotation.title! != "Bathroom") {
            return UIButton(type: .detailDisclosure)
        }
        else{
            return nil
        }
    }
    
    private func mapView(_ mapView: MGLMapView, annotation: MyAnnotation, calloutAccessoryControlTapped control: UIControl) {
        // Hide the callout view.
        urlToSend = annotation.URL
        mapView.deselectAnnotation(annotation, animated: false)
        performSegue(withIdentifier:"Info", sender: self)
    }
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if(segue.identifier=="info"){
        segue.destination=ModalViewController
            destination.myURL=urlToSend
        }
    }

}






