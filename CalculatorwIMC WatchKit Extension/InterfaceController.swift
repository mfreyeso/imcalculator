//
//  InterfaceController.swift
//  CalculatorwIMC WatchKit Extension
//
//  Created by Mario on 28/07/16.
//  Copyright © 2016 Mario. All rights reserved.
//

import WatchKit
import Foundation


class InterfaceController: WKInterfaceController {

    @IBOutlet var weightLabel: WKInterfaceLabel!
    @IBOutlet var heightLabel: WKInterfaceLabel!
    
    var weightSelected:Float = 0
    var heightSelected:Float = 0
    
    @IBAction func weightSlider(value: Float) {
        weightSelected = value
        weightLabel.setText(String(value))
    }
    
    @IBAction func heightSlider(value: Float) {
        heightSelected = (value / 100)
        heightLabel.setText(String(value/100))
    }
    
    func calculateIMC(weight:Float, height:Float) ->Float{
        let imcValue = (weight / (height * height))
        return imcValue
    }
    
    @IBAction func calculateButton() {
        let imcValue = calculateIMC(weightSelected, height: heightSelected)
        let detail = defineDetail(imcValue)
        let ResultContext = ResultIMC(detailOf: detail, value: imcValue )
        pushControllerWithName("ResultsController", context: ResultContext )
        
    }
    
    func defineDetail(result:Float)->String{
        
        let referenceValues = [18.5, 25.0, 30.0, 40.0]
        let referenceDetails = ["Under Weight", "Normal", "Obesity", "Morbid"]
        var response:String?
        for var i=0; i < referenceValues.count; i++ {
            if Double(result) <= referenceValues[i] {
                response = referenceDetails[i]
                break
            }
            
        }
        return response!
        
    }
    
    override func awakeWithContext(context: AnyObject?) {
        super.awakeWithContext(context)
        
        // Configure interface objects here.
    }

    override func willActivate() {
        // This method is called when watch view controller is about to be visible to user
        super.willActivate()
    }

    override func didDeactivate() {
        // This method is called when watch view controller is no longer visible
        super.didDeactivate()
    }

}
