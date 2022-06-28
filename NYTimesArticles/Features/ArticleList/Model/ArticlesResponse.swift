//
//  ArticlesResponse.swift
//  NYTimesArticles
//
//  Created by Hesham Mohammed on 28/06/2022.
//

import Foundation

struct ArticleResponse: Codable {
    let results:[Article]
}

struct Article: Codable {
    let title: String
    var media: [Media]
}

struct Media: Codable {
    let type: MediaType
    let mediaMetadata : [MediaMetadata]?
    
    private enum CodingKeys : String, CodingKey {
        case type, mediaMetadata = "media-metadata"
    }
}

enum MediaType: String, Codable {
    case image = "image"
}

struct MediaMetadata : Codable {
    let url: String
    let format: MediaFormat
}

enum MediaFormat: String, Codable {
    case standardThumbnail = "Standard Thumbnail"
    case mediumThreeByTwo210 = "mediumThreeByTwo210"
    case mediumThreeByTwo440 = "mediumThreeByTwo440"
    var index: Int {
        switch self {
        case .standardThumbnail:
            return 0
        case .mediumThreeByTwo210:
            return 1
        case .mediumThreeByTwo440:
            return 2
        }
    }
}
