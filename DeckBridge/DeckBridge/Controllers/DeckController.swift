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
    @IBOutlet weak var tableView: NSTableView!
    @IBOutlet weak var keyContainer: NSStackView!
    
    let device = TestDevice()
    var profile: Profile?
    
    var currentSelection: Int?
    
    override func viewDidLoad() {
        
        profile = Profile(device: device)
        
        NotificationCenter.default.addObserver(self, selector: #selector(didSelectKey(notification:)), name: .didSelectKey, object: nil)
        
        generateLayout()
        actionsTableViewController.inspectKey(nil)
    }
    
    func generateLayout() {
        
        for row in device.layout {
            var views = [KeyView]()
            for key in row {
                let newView = KeyView(position: key)
                newView.heightAnchor.constraint(equalToConstant: 84).isActive = true
                newView.widthAnchor.constraint(equalToConstant: 84).isActive = true
                views.append(newView)
            }
            
            let stackView = NSStackView(views: views)
            stackView.orientation = .horizontal
            stackView.distribution = .fill
            stackView.spacing = 0
            
            keyContainer.addArrangedSubview(stackView)
            
            
        }
    }
    
    @objc func didSelectKey(notification: NSNotification) {
        
        guard let selection = notification.object as? Int else {
            fatalError("Unknown key number in Notification.")
        }
        
        self.currentSelection = selection
        
        let key = profile?.keys.first {
            $0.position == selection
        }
        
        actionsTableViewController.inspectKey(key)
    }
}
