//
//  ActionsTableViewController.swift
//  DeckBridge
//
//  Created by Ivan on 1/6/19.
//  Copyright © 2019 OKatBest. All rights reserved.
//

import Cocoa

class ActionsTableViewController: NSViewController {

    @IBOutlet weak var stateView: StateView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    public func inspectKey(_ profile: KeyProfile?) {
        guard let profile = profile else {
            stateView.setState(.noSelection)
            return
        }
        
        guard profile.actions != nil, profile.actions?.isEmpty == false else {
            stateView.setState(.noAction)
            return
        }
    }
    
}

extension ActionsTableViewController: NSTableViewDelegate {

}


extension ActionsTableViewController: NSTableViewDataSource {
    func numberOfRows(in tableView: NSTableView) -> Int {
        return 2
    }
    
    func tableView(_ tableView: NSTableView, viewFor tableColumn: NSTableColumn?, row: Int) -> NSView? {
        return tableView.makeView(withIdentifier: .addActionButton , owner: self)
    }
}

extension NSUserInterfaceItemIdentifier {
    static let addActionButton = NSUserInterfaceItemIdentifier(rawValue: "addActionButton")
}
