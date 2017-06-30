//
//  MatchAnnotation.swift
//  Joinmatch-iOS
//
//  Created by Jorge Ríos on 25/06/17.
//  Copyright © 2017 Joinmatch-team. All rights reserved.
//

import MapKit

class MatchAnnotation : NSObject, MKAnnotation {
    var title: String?
    var subtitle: String?
    var coordinate: CLLocationCoordinate2D
    
    init(title: String, subtitle: String, coordinate: CLLocationCoordinate2D) {
        self.title = title
        self.subtitle = subtitle
        self.coordinate = coordinate
    }
}
