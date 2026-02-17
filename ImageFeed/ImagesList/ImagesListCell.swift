//
//  ImagesListCell.swift
//  ImageFeed
//
//  Created by Nikita Vorobiev on 14.02.2026.
//

import UIKit

final class ImagesListCell: UITableViewCell {
    
    // MARK: - Static Properties
    
    static let reuseIdentifier = "ImagesListCell"
    
    // MARK: - IBOutlets
    
    @IBOutlet weak var photoImageView: UIImageView!
    @IBOutlet weak var dateLabel: UILabel!
    @IBOutlet weak var likeButton: UIButton!
    
    // MARK: - Properties
    
    var likeState: LikeState = .off
}
