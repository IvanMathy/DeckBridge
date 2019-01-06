//
//  ActionContainer.swift
//  DeckBridge
//
//  Created by Ivan on 1/6/19.
//  Copyright © 2019 OKatBest. All rights reserved.
//

import Foundation

// Granted, we don't _really_ need this class. There are ways to
// deserialize protocol types straight from the decoder, but having
// this container as an intermediate step allows us to avoid writing
// custom logic for each type of action, registering them once instead.

class ActionContainer: Codable {
    let actionType: ActionType
    let action: Action
    
    private static let actionClasses: [Action.Type] = [
        SoundAction.self
    ]
    
    public init(_ action: Action) {
        self.action = action
        self.actionType = type(of: action).codableType
    }
    
    required public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
    
        
        self.actionType = try container.decode(ActionType.self, forKey: .actionType)
        self.action = try self.actionType.type.init(from: container.superDecoder(forKey: .parameters))
    }
    
    public func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try container.encode(self.actionType, forKey: .actionType)
        try action.encode(to: container.superEncoder(forKey: .parameters))
    }
    
    private enum CodingKeys: String, CodingKey {
        case actionType
        case parameters
    }

}
