//
//  LikeState.swift
//  ImageFeed
//
//  Created by Nikita Vorobiev on 18.02.2026.
//

import Foundation

enum LikeState: String {
    case on = "like_button_on"
    case off = "like_button_off"
    
    var imageName: String {
        rawValue
    }
}
