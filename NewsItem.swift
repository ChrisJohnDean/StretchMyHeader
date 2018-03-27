//
//  NewsItem.swift
//  StretchMyHeader
//
//  Created by Chris Dean on 2018-03-27.
//  Copyright © 2018 Chris Dean. All rights reserved.
//

import Foundation
import UIKit

struct NewsItem {
    
    enum NewsCategory: String {
        case world = "World"
        case americas = "Americas"
        case europe = "Europe"
        case middleEast = "MiddleEast"
        case africa = "Africa"
        case asiaPacific = "AsiaPacific"
        
        func toColor() -> UIColor {
            switch self {
            case .world:
                return UIColor.red
            case .americas:
                return UIColor.blue
            case .europe:
                return UIColor.green
            case .middleEast:
                return UIColor.yellow
            case .africa:
                return UIColor.orange
            case .asiaPacific:
                return UIColor.purple
            }
        }
    }
    
    let category: NewsCategory
    let summary: String
    
}
