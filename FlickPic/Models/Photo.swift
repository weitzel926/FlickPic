//
//  Photo.swift
//  FlickPic
//
//  Created by Wade Weitzel on 2/19/24.
//

import Foundation

struct Photo: Codable, Hashable {
    let title: String
    let link: URL
    let media: Media
    let date_taken: String
    let description: String
    let published: Date
    let author: String
    let tags: String
    
    var favoriteDetails = FavoriteDetails()
    
    struct Media: Codable, Hashable {
        let m: URL
    }
    
    enum CodingKeys: String, CodingKey {
        case title = "title"
        case link = "link"
        case media = "media"
        case date_taken = "date_taken"
        case description = "description"
        case published = "published"
        case author = "author"
        case tags = "tags"
    }
    
    init(title: String, link: URL, media: Media, date_taken: String, description: String, published: Date, author: String, tags: String, favoriteDetails: Photo.FavoriteDetails = FavoriteDetails()) {
        self.title = title
        self.link = link
        self.media = media
        self.date_taken = date_taken
        self.description = description
        self.published = published
        self.author = author
        self.tags = tags
        self.favoriteDetails = favoriteDetails
    }
    
    var photoURL: URL {
        return media.m
    }
    
    var datePublishedString: String {
        let dateFormatter = DateFormatter()
        dateFormatter.dateStyle = .medium
        
        return dateFormatter.string(from: published)
    }
    
    struct FavoriteDetails: Hashable, Codable {
        var comment: String = ""
        var rating: Int = 0
        
        mutating func setComment(_ comment: String) {
            self.comment = comment
        }
        
        mutating func setRating(_ rating: Int) {
            self.rating = rating
        }
    }
}
