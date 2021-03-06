//
//  RootViewController.swift
//  HPPluginRepo
//
//  Created by Hu, Peng on 30/11/2017.
//  Copyright © 2017 Hu, Peng. All rights reserved.
//

import UIKit

public struct MyTheme : ADKTheme {
    
    public var description: String {
        return "MyTheme"
    }
    public var mainColor: UIColor {
        return UIColor.colorFrom(hex: "0C5195")
    }
    public var fontColor: UIColor {
        return UIColor.white
    }
    public var floatingButtonSize: CGSize {
        return CGSize(width: 60, height: 60)
    }
    public var floationButtonColor: UIColor {
        return UIColor.colorFrom(hex: "0C5195")
    }
    public var floatingButtonText: String {
        return NSLocalizedString("MyBtn", comment: self.description)
    }
    public var floationButtonTextColor: UIColor {
        return UIColor.yellow
    }
    public var floationButtonFontSize: CGFloat {
        return 14.0
    }
}

class RootViewController: UITableViewController {

    private let dataSource = ["Debug Kit Demo", "Slide Plugin Demo", "Calendar Demo", "Password Plugin Demo"]
    private let segueIDs = ["openDebugKitPage", "openSlidePluginPage", "openCalendarDemoPage", "openPasswordPluginPage"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Important! : init event handler for ADK Demo
        ADKSettingCellEventCenter.register(eventHandler: HDKSettingEventHandler())
        // user self-defined thems for debug kit
        if !appSettings.ADKUserDefaultTheme {
            HDKContext.shared.theme = MyTheme()
        } else {
            HDKContext.shared.theme = ADKDefaultTheme()
        }
    }

    // MARK: - Table view data source
    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return dataSource.count
    }


    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        cell.textLabel?.text = dataSource[indexPath.row]
        return cell
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if indexPath.row == 0 {
            HDKFloatingButton.shift()
        } else {
            self.performSegue(withIdentifier: segueIDs[indexPath.row], sender: self)
        }
        tableView.cellForRow(at: indexPath)?.setSelected(false, animated: false)
    }
}
