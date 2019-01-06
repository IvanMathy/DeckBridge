//
//  DeckController.swift
//  DeckBridge
//
//  Created by Ivan on 1/6/19.
//  Copyright © 2019 OKatBest. All rights reserved.
//

import Foundation
import AppKit

class DeckController: NSViewController {
    @IBOutlet var actionsTableViewController: ActionsTableViewController!
    
    @IBOutlet weak var stateView: StateView!
    @IBOutlet weak var tableView: NSTableView!
    var profile = Profile()
    
    override func viewDidLoad() {
        stateView.setState(.noSelection)
    }
}
