//
//  ConfigureOptionsTableViewController.swift
//  TeslaModel3
//
//  Created by Sophia Shaw on 12/4/17.
//  Copyright © 2017 Soph Shaw. All rights reserved.
//

import UIKit

var indexPaths: [Int] = [0,0,0,0,0]

class ConfigureOptionsTableViewController: UITableViewController {
    
    let sections: [String] = ["Battery", "Premium Upgrade", "Autopilot", "Wheel", "Color"]
    let batteryData: [String] = ["Standard", "Long Range"]
    let upgradeData: [String] = ["No", "Yes"]
    let autopilotData: [String] = ["None", "Enhanced", "Full Self-Driving"]
    let wheelData: [String] = ["18\" Aero", "19\" Sport"]
    let colorData: [String] = ["Black", "Midnight Silver Metallic", "Deep Blue Metallic", "Silver Metallic", "Pearl White Multi-Coat", "Red Multi-Coat"]
    
    var sectionData: [Int: [String]] = [:]
    
    var batterySelectedIndexPath: IndexPath? = IndexPath(row: indexPaths[0], section: 0)
    var upgradeSelectedIndexPath: IndexPath? = IndexPath(row: indexPaths[1], section: 1)
    var autopilotSelectedIndexPath: IndexPath? = IndexPath(row: indexPaths[2], section: 2)
    var wheelSelectedIndexPath: IndexPath? = IndexPath(row: indexPaths[3], section: 3)
    var colorSelectedIndexPath: IndexPath? = IndexPath(row: indexPaths[4], section: 4)
    
  

    override func viewDidLoad() {
        super.viewDidLoad()
        
        sectionData = [0:batteryData, 1:upgradeData, 2:autopilotData, 3:wheelData, 4:colorData]
        
        tableView.allowsMultipleSelection = true
    }
    
    override func viewDidAppear(_ animated: Bool) {
        tableView.cellForRow(at: batterySelectedIndexPath!)?.accessoryType = UITableViewCellAccessoryType.checkmark
        tableView.cellForRow(at: upgradeSelectedIndexPath!)?.accessoryType = UITableViewCellAccessoryType.checkmark
        tableView.cellForRow(at: autopilotSelectedIndexPath!)?.accessoryType = UITableViewCellAccessoryType.checkmark
        tableView.cellForRow(at: wheelSelectedIndexPath!)?.accessoryType = UITableViewCellAccessoryType.checkmark
        tableView.cellForRow(at: colorSelectedIndexPath!)?.accessoryType = UITableViewCellAccessoryType.checkmark
    }
    

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        return sections.count
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return (sectionData[section]?.count)!
    }
    
    override func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return sections[section]
    }
    
    override func tableView(_ tableView: UITableView, willDisplayHeaderView view: UIView, forSection section: Int) {
        let header = view as! UITableViewHeaderFooterView
        header.textLabel?.font = UIFont(name: "Copperplate", size: 19)
        header.textLabel?.textColor = UIColor.white
    }
    
    override func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let view = UITableViewHeaderFooterView.init(frame: CGRect.init(x: 0, y: 0, width: tableView.bounds.width, height: tableView.sectionHeaderHeight))
        view.contentView.backgroundColor = UIColor.darkGray
        return view
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath)
        cell.textLabel?.font = UIFont(name: "Copperplate", size: 17)
        
        if selectedPath(indexPath: indexPath) {
            cell.accessoryType = UITableViewCellAccessoryType.checkmark
        }
        else {
            cell.accessoryType = UITableViewCellAccessoryType.none
        }
        cell.textLabel?.text = sectionData[indexPath.section]?[indexPath.row]

        return cell
    }
    
    func selectedPath(indexPath: IndexPath) -> Bool {
        return indexPath == batterySelectedIndexPath || indexPath == colorSelectedIndexPath || indexPath == upgradeSelectedIndexPath || indexPath == autopilotSelectedIndexPath || indexPath == wheelSelectedIndexPath
    }
    
    
    func selectManagement(section: Int, sectionIndexPath: IndexPath?, indexPath: IndexPath) -> IndexPath? {
        var selectedindex = sectionIndexPath
        if indexPath.section == section {
            if selectedindex != indexPath {
                tableView.cellForRow(at: selectedindex!)?.accessoryType = UITableViewCellAccessoryType.none
                tableView.cellForRow(at: indexPath)?.accessoryType = UITableViewCellAccessoryType.checkmark
                indexPaths[section] = indexPath.row
                selectedindex = indexPath
            }
        }
        return selectedindex
    }
    
    
    func selection(indexPath: IndexPath) {
        batterySelectedIndexPath = selectManagement(section: 0, sectionIndexPath: batterySelectedIndexPath, indexPath: indexPath)
        upgradeSelectedIndexPath = selectManagement(section: 1, sectionIndexPath: upgradeSelectedIndexPath, indexPath: indexPath)
        autopilotSelectedIndexPath = selectManagement(section: 2, sectionIndexPath: autopilotSelectedIndexPath, indexPath: indexPath)
        wheelSelectedIndexPath = selectManagement(section: 3, sectionIndexPath: wheelSelectedIndexPath, indexPath: indexPath)
        colorSelectedIndexPath = selectManagement(section: 4, sectionIndexPath: colorSelectedIndexPath, indexPath: indexPath)
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        selection(indexPath: indexPath)
    }


    override func tableView(_ tableView: UITableView, didDeselectRowAt indexPath: IndexPath) {
        selection(indexPath: indexPath)
    }
    
    // MARK: - Calculation data

    var standardBattery = 35000
    var longRange = 44000
    var batteryPrice = 0
    func batteryPrice(indexPath: IndexPath?) -> Int {
        var amount = 35000
        if indexPath?.row == 0 {
            amount = standardBattery
        } else {
            amount = longRange
        }
        return amount
    }
    
    var premium = 5000
    var standard = 0
    var premiumPrice = 0
    func premiumPrice(indexPath: IndexPath?) -> Int {
        var amount = 0
        if indexPath?.row == 0 {
            amount = standard
        } else {
            amount = premium
        }
        return amount
    }
    
    var full = 8000
    var autoPrice = 0
    func autoPrice(indexPath: IndexPath?) -> Int {
        var amount = 0
        if indexPath?.row == 0 {
            amount = standard
        } else if indexPath?.row == 1{
            amount = premium
        } else {
            amount = full
        }
        return amount
    }
    
    var sportWheel = 1500
    var wheelPrice = 0
    func wheelPrice(indexPath: IndexPath?) -> Int {
        var amount = 0
        if indexPath?.row == 0 {
            amount = standard
        } else if indexPath?.row == 1 {
            amount = sportWheel
        } 
        return amount
    }

    var otherColorPrice = 1000
    var colorPrice = 0
    func colorPrice(indexPath: IndexPath?) -> Int {
        var amount = 0
        if indexPath?.row == 0 {
            amount = standard
        } else {
            amount = otherColorPrice
        }
        return amount
    }
    
    var totalPrice = 0
    func totalPrice(battery: Int, upgrade: Int, autopilot: Int, wheel: Int, color: Int) -> Int{
        return battery + upgrade + autopilot + wheel + color
    }
    
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        switch segue.identifier {
        case "showPrice"?:
            
                batteryPrice = batteryPrice(indexPath: batterySelectedIndexPath)
                premiumPrice = premiumPrice(indexPath: upgradeSelectedIndexPath)
                autoPrice = autoPrice(indexPath: autopilotSelectedIndexPath)
                wheelPrice = wheelPrice(indexPath: wheelSelectedIndexPath)
                colorPrice = colorPrice(indexPath: colorSelectedIndexPath)
                totalPrice = totalPrice(battery: batteryPrice, upgrade: premiumPrice, autopilot: autoPrice, wheel: wheelPrice, color: colorPrice)
                let destinationVC = segue.destination as! CalculatorViewController
                destinationVC.batteryPrice = batteryPrice
                destinationVC.premiumPrice = premiumPrice
                destinationVC.autopilotPrice = autoPrice
                destinationVC.wheelPrice = wheelPrice
                destinationVC.colorPrice = colorPrice
                destinationVC.finalPrice = totalPrice
        
        default:
            preconditionFailure("Unexpected segue identifier")
        }
    }
    
}
