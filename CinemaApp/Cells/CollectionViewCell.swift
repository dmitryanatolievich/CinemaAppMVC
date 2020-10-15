//
//  CollectionViewCell.swift
//  CinemaApp
//
//  Created by Dmitry Anatolievich on 16.09.2020.
//  Copyright © 2020 Dmitry Anatolievich. All rights reserved.
//

import UIKit

protocol WatchTrailerProtocol {
    var watchTrailerDidTapped: () -> () { get set }
}

class CollectionViewCell: UICollectionViewCell, WatchTrailerProtocol{
    var model: MovieModel?
    @IBOutlet var genreImageView: UIImageView!
    @IBOutlet var filmNameLabelOutlet: UILabel!
    @IBOutlet var starImageViewOutlet: UIImageView!
    @IBOutlet var ratingLabelOutlet: UILabel!
    @IBOutlet var watchButtonOutlet: UIButton!
    
    var watchTrailerDidTapped: () -> () = {}
    
    override func awakeFromNib() {
        super.awakeFromNib()
        watchButtonOutlet.addTarget(self, action: #selector(handleWatchTrailerTap), for: .touchUpInside)
    }
    
    @objc func handleWatchTrailerTap() {
        self.watchTrailerDidTapped()
    }
    
    func configCellElements() {
        watchButtonOutlet.addButtonSettings()
        filmNameLabelOutlet.numberOfLines = 0
    }
}
