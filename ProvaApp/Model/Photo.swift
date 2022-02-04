//
//  Photo.swift
//  ProvaApp
//
//  Created by michael.sanelli on 04/02/22.
//

import Foundation

struct Photo: Decodable {
    let albumId: Int
    let id: Int
    let title: String
    let url: String
    let thumbnailUrl: String
    
    enum CodingKeys : String, CodingKey {
        case albumId
        case id
        case title
        case url
        case thumbnailUrl
    }
}
