//
//  ViewController.swift
//  ImageFeed
//
//  Created by Nikita Vorobiev on 13.02.2026.
//

import UIKit

final class ImagesListViewController: UIViewController {
    
    // MARK: - IBOutlets
    
    @IBOutlet private var tableView: UITableView!
    
    // MARK: - Properties
    
    private enum Constants {
        static let rowHeight: CGFloat = 200
        static let verticalInset: CGFloat = 12
    }
    
    private let photosName: [String] = Array(0..<20).map{ "\($0)" }
    
    private lazy var dateFormatter: DateFormatter = {
        let formatter = DateFormatter()
        formatter.dateStyle = .long
        formatter.timeStyle = .none
        return formatter
    }()
    
    // MARK: - Lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureTableView()
    }
    
    private func configureTableView() {
        tableView.rowHeight = Constants.rowHeight
        tableView.contentInset = UIEdgeInsets(
            top: Constants.verticalInset,
            left: 0,
            bottom: Constants.verticalInset,
            right: 0
        )
    }
    
    // MARK: - Private Methods
    
    private func configCell(for cell: ImagesListCell, with indexPath: IndexPath) {
        let imageName = photosName[indexPath.row]
        
        guard let image = UIImage(named: imageName) else {
            return
        }
        
        cell.photoImageView.image = image
        cell.dateLabel.text = dateFormatter.string(from: Date())
        cell.likeState = indexPath.row % 2 == 0 ? .on : .off
        cell.likeButton.setBackgroundImage(UIImage(named: cell.likeState.imageName), for: .normal)
    }
    
}

// MARK: - UITableViewDelegate

extension ImagesListViewController: UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        // TODO: Handle cell selection
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        let imageName = photosName[indexPath.row]
        
        guard let image = UIImage(named: imageName) else {
            return Constants.rowHeight
        }
        
        let imageViewWidth = tableView.bounds.width
        let imageWidth = image.size.width
        
        guard imageWidth != 0 else {
            return 0
        }
        
        let imageHeight = image.size.height * imageViewWidth / imageWidth
        
        // Добавляем padding сверху и снизу
        let totalPadding: CGFloat = Constants.verticalInset * 2
        
        return imageHeight + totalPadding
    }
    
}

// MARK: - UITableViewDataSource

extension ImagesListViewController: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return photosName.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: ImagesListCell.reuseIdentifier, for: indexPath)
        
        guard let imageListCell = cell as? ImagesListCell else {
            return UITableViewCell()
        }
        
        configCell(for: imageListCell, with: indexPath)
        return imageListCell
    }
    
}

