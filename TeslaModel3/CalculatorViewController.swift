//
//  CalculatorViewController.swift
//  TeslaModel3
//
//  Created by Sophia Shaw on 12/8/17.
//  Copyright © 2017 Soph Shaw. All rights reserved.
//

import UIKit

class CalculatorViewController: UIViewController {
    
    @IBOutlet weak var batteryPriceLabel: UILabel!
    @IBOutlet weak var premiumPriceLabel: UILabel!
    @IBOutlet weak var finalCostLabel: UILabel!
    @IBOutlet weak var colorPriceLabel: UILabel!
    @IBOutlet weak var wheelPriceLabel: UILabel!
    @IBOutlet weak var autopilotPriceLabel: UILabel!
    
    var batteryPrice: Int = 0
    var premiumPrice: Int = 0
    var finalPrice: Int = 0
    var colorPrice: Int = 0
    var wheelPrice: Int = 0
    var autopilotPrice: Int = 0
    
    let numberFormatter: NumberFormatter = {
        let nf = NumberFormatter ()
        let chinaLocale = NSLocale(localeIdentifier: "en_US")
        nf.numberStyle = .currency
        nf.locale = chinaLocale as Locale!
        return nf
    } ()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        //batteryPriceLabel.text = batteryPrice
        batteryPriceLabel.text = numberFormatter.string(from: NSNumber(value: batteryPrice))
        premiumPriceLabel.text = numberFormatter.string(from: NSNumber(value: premiumPrice))
        autopilotPriceLabel.text = numberFormatter.string(from: NSNumber(value: autopilotPrice))
        wheelPriceLabel.text = numberFormatter.string(from: NSNumber(value: wheelPrice))
        colorPriceLabel.text = numberFormatter.string(from: NSNumber(value: colorPrice))
        finalCostLabel.text = numberFormatter.string(from: NSNumber(value: finalPrice))
    }
    
}
