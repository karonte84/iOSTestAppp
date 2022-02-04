//
//  GalleryCollectionViewCell.swift
//  ProvaApp
//
//  Created by michael.sanelli on 03/02/22.
//

import UIKit

class GalleryCollectionViewCell: UICollectionViewCell {
    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var label: UILabel!
    
    func setData(_ photo: Photo) {
        label.text = photo.title
        if let url = URL(string: photo.thumbnailUrl) {
            imageView.load(from: url)
        }
    }
}
