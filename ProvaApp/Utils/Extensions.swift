//
//  Extensions.swift
//  ProvaApp
//
//  Created by michael.sanelli on 03/02/22.
//
import UIKit

extension UIImageView {
    func load(from url: URL) {
        URLSession.shared.dataTask(with: url, completionHandler: { data, response, error in
            guard let data = data, error == nil else { return }
            // always update the UI from the main thread
            DispatchQueue.main.async() { [weak self] in
                self?.image = UIImage(data: data)
            }
        }).resume()
    }
}
