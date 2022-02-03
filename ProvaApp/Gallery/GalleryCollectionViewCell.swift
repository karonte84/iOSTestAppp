//
//  GalleryCollectionViewCell.swift
//  ProvaApp
//
//  Created by michael.sanelli on 03/02/22.
//

import UIKit

class GalleryCollectionViewCell: UICollectionViewCell {
    @IBOutlet weak var imageView: UIImageView!
    
    func setData(_ url: String) {
        if let url = URL(string: url) {
            imageView.load(from: url)
        }
    }
}
