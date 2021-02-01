//
//  MovieModel.swift
//  BerkayKara
//
//  Created by Berkay KARA on 16.01.2021.
//

import Foundation

struct MovieRSS: Decodable {
    let feed: MovieFeed
}

struct MovieFeed: Decodable {
    let results: [MovieResult]
}

struct MovieResult: Decodable, Hashable {
    let name, artistName, artworkUrl100, releaseDate, url: String
    let genres: [Genres]
}
