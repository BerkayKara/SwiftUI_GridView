//
//  BookModel.swift
//  BerkayKara
//
//  Created by Berkay KARA on 16.01.2021.
//

import Foundation

struct BookRSS: Decodable {
    let feed: BookFeed
}

struct BookFeed: Decodable {
    let results: [BookResult]
}

struct BookResult: Decodable, Hashable {
    let name, artistName, artworkUrl100, releaseDate, url: String
    let genres: [Genres]
}
