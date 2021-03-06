//
//  GalleryViewController.swift
//  ProvaApp
//
//  Created by michael.sanelli on 03/02/22.
//

import UIKit

class GalleryViewController: UIViewController {
    @IBOutlet weak var collectionView: UICollectionView!
    @IBOutlet weak var activityIndicator: UIActivityIndicatorView!
    
    var photos : [Photo] = []
    
    private let apiRequest = APIRequest<[Photo]>(urlString: "https://jsonplaceholder.typicode.com/photos")
    private let viewModel : GalleryViewModel = GalleryViewModel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        collectionView.dataSource = self
        collectionView.delegate = self
        
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .vertical
        layout.minimumLineSpacing = 8
        layout.minimumInteritemSpacing = 4
        
        collectionView.setCollectionViewLayout(layout, animated: true)
        // Do any additional setup after loading the view.
        
        setupObservers()
        viewModel.getPhotos()
    }
    
    private func setupObservers() {
        viewModel.isLoading.observe(on: self, observerBlock: { isLoading in
            if isLoading {
                self.activityIndicator.startAnimating()
            } else {
                self.activityIndicator.stopAnimating()
            }
        })
        viewModel.error.observe(on: self, observerBlock: { error in
            if let errorUnwrapped = error {
                print(errorUnwrapped)
            }
        })
        viewModel.response.observe(on: self, observerBlock: {photos in
            self.photos.append(contentsOf: photos)
            self.collectionView.reloadData()
        })
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}

extension GalleryViewController : UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return photos.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "GalleryCollectionViewCell", for: indexPath) as? GalleryCollectionViewCell
        cell?.setData(photos[indexPath.row])
        return cell!
    }
}

extension GalleryViewController : UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        return UIEdgeInsets(top: 1.0, left: 8.0, bottom: 1.0, right: 8.0)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let collectionViewLayout = collectionViewLayout as? UICollectionViewFlowLayout
        let widthItem = collectionView.frame.width / 2 - collectionViewLayout!.minimumInteritemSpacing - collectionViewLayout!.minimumLineSpacing
        return CGSize(width: widthItem, height: 250)
    }
}
