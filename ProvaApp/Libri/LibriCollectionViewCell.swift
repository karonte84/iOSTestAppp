//
//  LibriCollectionViewCell.swift
//  ProvaApp
//
//  Created by michael.sanelli on 03/02/22.
//

import UIKit

class LibriCollectionViewCell: UICollectionViewCell {
    @IBOutlet weak var imageView: UIImageView!
    
    func setData(_ libro: Libro) {
        if let url = URL(string: libro.copertina) {
            imageView.load(from: url)
        }
    }
}
