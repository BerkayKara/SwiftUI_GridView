//
//  MusicModel.swift
//  BerkayKara
//
//  Created by Berkay KARA on 16.01.2021.
//

import Foundation

struct MusicRSS: Decodable {
    let feed: MusicFeed
}

struct MusicFeed: Decodable {
    let results: [MusicResult]
}

struct MusicResult: Decodable, Hashable {
    let name, artistName, artworkUrl100, collectionName, url: String
    let genres: [Genres]
}
struct Genres: Decodable, Hashable{
    let name: String
}
