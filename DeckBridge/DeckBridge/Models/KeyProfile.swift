//
//  KeyProfile.swift
//  DeckBridge
//
//  Created by Ivan on 1/6/19.
//  Copyright © 2019 OKatBest. All rights reserved.
//

import Foundation

class KeyProfile: Codable {
    public let position: Int
    public var actions: [Action]? = nil
    
    init(position:Int) {
        self.position = position
    }
    
    required public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        
        let actionContainers = try container.decodeIfPresent([ActionContainer].self, forKey: .actions)
        self.actions = actionContainers?.map{ $0.action }
        
        self.position = try container.decode(Int.self, forKey: .position)
    }
    
    public func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try container.encode(self.position, forKey: .position)
        try container.encode(self.actions?.map(ActionContainer.init), forKey: .actions)
    }
    
    private enum CodingKeys: String, CodingKey {
        case position
        case actions
    }

}
