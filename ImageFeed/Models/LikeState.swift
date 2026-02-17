//
//  LikeState.swift
//  ImageFeed
//
//  Created by Nikita Vorobiev on 18.02.2026.
//

import Foundation

enum LikeState {
    case on
    case off
    
    var imageName: String {
        switch self {
        case .on: return "like_button_on"
        case .off: return "like_button_off"
        }
    }
}
