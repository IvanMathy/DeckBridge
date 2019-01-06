//
//  ActionType.swift
//  DeckBridge
//
//  Created by Ivan on 1/6/19.
//  Copyright © 2019 OKatBest. All rights reserved.
//

import Foundation

enum ActionType: String, Codable {
    case sound
    
    var type: Action.Type {
        switch self {
        case .sound:
            return SoundAction.self
        }
    }
}
