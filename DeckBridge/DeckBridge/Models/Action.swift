//
//  Action.swift
//  DeckBridge
//
//  Created by Ivan on 1/6/19.
//  Copyright © 2019 OKatBest. All rights reserved.
//

import Foundation

protocol Action: Codable {
    
    static var codableType: ActionType { get }

}
