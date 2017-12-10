//
//  ViewController.swift
//  TeslaModel3
//
//  Created by Sophia Shaw on 12/2/17.
//  Copyright © 2017 Soph Shaw. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var leadingConstraint: NSLayoutConstraint!
    @IBOutlet weak var menuView: UIView!
    
    var menuShowing = false
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        menuView.layer.shadowOpacity = 1
        menuView.layer.shadowRadius = 6
    }

    @IBAction func openMenu(_ sender: Any) {
        if (menuShowing) {
            leadingConstraint.constant = -150
            UIView.animate(withDuration: 0.3, animations: {
                self.view.layoutIfNeeded()
            })
        } else {
            leadingConstraint.constant = 0
            UIView.animate(withDuration: 0.3, animations: {
                 self.view.layoutIfNeeded()
            })
        }
        menuShowing = !menuShowing
    }
   
}

