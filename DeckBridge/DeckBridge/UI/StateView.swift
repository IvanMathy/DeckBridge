//
//  StateView.swift
//  DeckBridge
//
//  Created by Ivan on 1/6/19.
//  Copyright © 2019 OKatBest. All rights reserved.
//

import Cocoa

class StateView: NSView {

    @IBOutlet weak var scrollView: NSScrollView!
    @IBOutlet weak var label: NSTextField!
    @IBOutlet weak var button: NSButton!
    
    enum State {
        case ready
        case noAction
        case noSelection
    }
  
    public func setState(_ state: State) {
        switch state {
        case .ready:
            show(false)
        case .noAction:
            show(true)
            button.isHidden = false
            label.stringValue = "You don't have any action on the selected key. Let's change that!"
        case.noSelection:
            show(true)
            button.isHidden = true
            label.stringValue = "Select a key to get started."
        }
    }
    
    func show(_ shouldShow: Bool) {
        scrollView.isHidden = shouldShow
        self.isHidden = !shouldShow
    }
    
}
