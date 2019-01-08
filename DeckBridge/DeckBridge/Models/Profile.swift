//
//  Profile.swift
//  DeckBridge
//
//  Created by Ivan on 1/6/19.
//  Copyright © 2019 OKatBest. All rights reserved.
//

import Foundation

class Profile: Codable {
    var keys: [KeyProfile]
    
    init(device: Device) {
        keys = [KeyProfile]()
        
        for row in device.layout {
            for key in row {
                let keyProfile = KeyProfile(position: key)
                keys.append(keyProfile)
            }
        }
    }
}
