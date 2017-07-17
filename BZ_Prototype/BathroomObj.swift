//
//  BathroomObj.swift
//  BZ_Prototype
//
//  Created by caganhawthorne on 5/30/17.
//  Copyright © 2017 Cagan Hawthorne. All rights reserved.
//

import Foundation
import Mapbox

class BathroomObj:NSObject {
    init(latitude:Double, longitude:Double){
        lat=latitude
        long=longitude
        markersVisible = false
        bathroomPt = MGLPointAnnotation()
        bathroomPt.coordinate = CLLocationCoordinate2D(latitude: lat, longitude: long)
        bathroomPt.title = "Bathroom"
    }
    
    init(latitude:Double, longitude:Double, description:String) {
        lat=latitude
        long=longitude
        markersVisible = false
        bathroomPt = MGLPointAnnotation()
        bathroomPt.coordinate = CLLocationCoordinate2D(latitude: lat, longitude: long)
        bathroomPt.title = "Bathroom"
        bathroomPt.subtitle = description
    }
    
    func toggleMarkers()->Bool {
        markersVisible = !markersVisible
        return !markersVisible
    }
    
    func getAnnotation()->MGLPointAnnotation {
        return bathroomPt
    }

    var markersVisible: Bool!
    var bathroomPt: MGLPointAnnotation!
    let lat:Double!
    let long:Double!
}

