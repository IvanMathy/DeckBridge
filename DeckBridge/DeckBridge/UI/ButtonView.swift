//
//  ButtonView.swift
//  BridgeDeck
//
//  Created by Ivan on 7/21/18.
//  Copyright © 2018 OKatBest. All rights reserved.
//

import Cocoa

@IBDesignable class ButtonView: NSView {
    
    @IBInspectable var selected:Bool = false
    @IBInspectable var position:Int = 0

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
    
    override func mouseDown(with event: NSEvent) {
        self.selected = !selected
        self.needsDisplay = true
    }
    
}
