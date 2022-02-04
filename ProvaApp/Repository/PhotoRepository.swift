//
//  PhotoRepository.swift
//  ProvaApp
//
//  Created by michael.sanelli on 04/02/22.
//

import Foundation

protocol PhotoRepository {
    func getPhotos(with completion: @escaping(Result<[Photo], NetworkError>) -> Void)
}

class PhotoRepositoryAPI : PhotoRepository {
    func getPhotos(with completion: @escaping (Result<[Photo], NetworkError>) -> Void) {
        let apiRequest = APIRequest<[Photo]>(urlString: "https://jsonplaceholder.typicode.com/photos")
        apiRequest.perform(with: completion)
    }
}
