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
    @IBOutlet weak var keyContainer: NSStackView!
    var profile = Profile()
    
    override func viewDidLoad() {
        stateView.setState(.noSelection)
        
        let device = TestDevice()
        
        for row in device.layout {
            var views = [ButtonView]()
            for key in row {
                let newView = ButtonView()
                newView.heightAnchor.constraint(equalToConstant: 84).isActive = true
                newView.widthAnchor.constraint(equalToConstant: 84).isActive = true
                newView.position = key
                views.append(newView)
            }
            
            let stackView = NSStackView(views: views)
            stackView.orientation = .horizontal
            stackView.distribution = .fill
            stackView.spacing = 0
            
            keyContainer.addArrangedSubview(stackView)
            
        }
    }
}
