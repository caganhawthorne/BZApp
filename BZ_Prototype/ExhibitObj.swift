//
//  ExhibitObj.swift
//  BZ_Prototype
//
//  Created by caganhawthorne on 5/30/17.
//  Copyright © 2017 Cagan Hawthorne. All rights reserved.
//

import Foundation
import Mapbox

class ExhibitObj:NSObject {
    init(name:String,lat:Double,long:Double){
        markersVisible = false
        exhibitPt = MyAnnotation()
        exhibitPt.coordinate = CLLocationCoordinate2D(latitude: lat, longitude: long)
        exhibitPt.title = name
    }
    
    init(name:String, url:String, lat:Double,long:Double){
        markersVisible = false
        exhibitPt = MyAnnotation()
        exhibitPt.coordinate = CLLocationCoordinate2D(latitude: lat, longitude: long)
        exhibitPt.title = name
        exhibitPt.URL = url
    }
    
    func toggleMarkers()->Bool {
        markersVisible = !markersVisible
        return !markersVisible
    }

    var markersVisible: Bool!
    var exhibitPt: MyAnnotation!

}
