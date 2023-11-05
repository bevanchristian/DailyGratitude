//
//  Item.swift
//  DailyGratitude
//
//  Created by IDN MEDIA on 05/11/23.
//

import Foundation
import SwiftData

@Model
final class Item {
    var timestamp: Date
    
    init(timestamp: Date) {
        self.timestamp = timestamp
    }
}
