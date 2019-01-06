//
//  OKError.swift
//  DeckBridge
//
//  Created by Ivan on 1/6/19.
//  Copyright © 2019 OKatBest. All rights reserved.
//

import Foundation

// I know this is an unfortunate name but I tend to call things
// OKSomething and at this point I'm too invested in that scheme
// to find a better naming convention just for this class.

struct OKError: Error {
    public var localizedDescription: String
    
    init(_ localizedDescription: String) {
        self.localizedDescription = localizedDescription
    }
}
