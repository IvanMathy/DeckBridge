//
//  Device.swift
//  DeckBridge
//
//  Created by Ivan on 1/7/19.
//  Copyright © 2019 OKatBest. All rights reserved.
//

import Foundation

protocol Device {
    static var deviceKey: String { get }
    static var layout: [[Int]] { get }
}

extension Device {
    var keyCount: Int {
        get {
            return layout.map({ $0.count }).reduce(0, +)
        }
    }
    
    var layout: [[Int]] {
        get {
            return type(of:self).layout
        }
    }
}
