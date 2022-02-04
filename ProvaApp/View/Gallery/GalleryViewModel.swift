//
//  GalleryViewModel.swift
//  ProvaApp
//
//  Created by michael.sanelli on 04/02/22.
//

import Foundation

class GalleryViewModel {
    private let repository: PhotoRepository = PhotoRepositoryAPI()
    
    let response : Observable<[Photo]> = Observable([])
    let isLoading : Observable<Bool> = Observable(false)
    let error : Observable<NetworkError?> = Observable(nil)
    
    func getPhotos() {
        isLoading.value = true
        repository.getPhotos(with: { result in
            switch result {
                case .success (let data):
                    self.response.value = data
                case .failure (let error):
                    self.error.value = error
            }
            
            self.isLoading.value = false
            
        })
    }
}
