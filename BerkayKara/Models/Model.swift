//
//  Model.swift
//  BerkayKara
//
//  Created by Berkay KARA on 8.02.2021.
//

import Foundation

struct RSS: Decodable {
    let feed: Feed
}

struct Feed: Decodable {
    let results: [Result]
}

struct Result: Decodable, Hashable {
    let name, artistName, artworkUrl100, collectionName, releaseDate, url, copyright: String?
    let genres: [Genres]
}

struct Genres: Decodable, Hashable{
    let name: String?
}
