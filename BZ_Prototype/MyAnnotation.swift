//
//  MyAnnotation.swift
//  BZ_Prototype
//
//  Created by caganhawthorne on 7/11/17.
//  Copyright © 2017 Cagan Hawthorne. All rights reserved.
//

import UIKit
import Mapbox

class MyAnnotation: MGLPointAnnotation {
    
    override init(){
        super.init()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    var URL: String!
    
}
