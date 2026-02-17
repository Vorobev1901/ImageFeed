//
//  ImagesListCell.swift
//  ImageFeed
//
//  Created by Nikita Vorobiev on 14.02.2026.
//

import UIKit

final class ImagesListCell: UITableViewCell {
    static let reuseIdentifier = "ImagesListCell"
    
    @IBOutlet weak var photoImageView: UIImageView!
    @IBOutlet weak var dateLabel: UILabel!
    @IBOutlet weak var likeButton: UIButton!
    
    var likeState: LikeState = .off
}
