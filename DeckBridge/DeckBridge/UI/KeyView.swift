//
//  KeyView.swift
//  BridgeDeck
//
//  Created by Ivan on 7/21/18.
//  Copyright © 2018 OKatBest. All rights reserved.
//

import Cocoa

@IBDesignable class KeyView: NSView {
    
    @IBInspectable var selected:Bool = false
    @IBInspectable var position:Int = 0
    
    init(position:Int) {
        self.position = position
        super.init(frame: NSRect.zero)
        NotificationCenter.default.addObserver(self, selector: #selector(didSelectKey(notification:)), name: .didSelectKey, object: nil)
    }
    
    required init?(coder decoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func draw(_ dirtyRect: NSRect) {
        super.draw(dirtyRect)

        //// Color Declarations
        let color = NSColor(calibratedRed: 0, green: 0.603, blue: 1, alpha: 1)
        
        //// Rectangle Drawing
        let rectanglePath = NSBezierPath(roundedRect: NSMakeRect(6, 6, 72, 72), xRadius: 7, yRadius: 7)
        NSColor.gray.setFill()
        rectanglePath.fill()
        
        if selected {
            //// Rectangle 2 Drawing
            let rectangle2Path = NSBezierPath(roundedRect: NSMakeRect(2, 2, 80, 80), xRadius: 10.5, yRadius: 10.5)
            color.setStroke()
            rectangle2Path.lineWidth = 4
            rectangle2Path.stroke()
        }
       

    }
    
    // State Handling
    
    override func mouseDown(with event: NSEvent) {
        self.setSelected(true)
        
        NotificationCenter.default.post(name: .didSelectKey, object: self.position)
    }
    
    @objc func didSelectKey(notification: NSNotification) {
        
        guard let selection = notification.object as? Int,
            selection != position else {
            return
        }
        
        self.setSelected(false)
    }
    
    func setSelected(_ state: Bool) {
        self.selected = state
        self.needsDisplay = true
    }
}
