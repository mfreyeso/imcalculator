//
//  ResultIMC.swift
//  CalculatorwIMC
//
//  Created by Mario on 28/07/16.
//  Copyright © 2016 Mario. All rights reserved.
//

import WatchKit

class ResultIMC: NSObject {
    
    var detail:String!
    var valueIMC:Float = 0
    
    init(detailOf:String, value:Float) {
        detail = detailOf
        valueIMC = value
    }
    
}
