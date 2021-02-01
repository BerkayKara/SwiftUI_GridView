//
//  AppModel.swift
//  BerkayKara
//
//  Created by Berkay KARA on 16.01.2021.
//

import Foundation

struct AppRSS: Decodable {
    let feed: AppFeed
}

struct AppFeed: Decodable {
    let results: [AppResult]
}

struct AppResult: Decodable, Hashable {
    let copyright, name, artworkUrl100, releaseDate, url: String
    let genres: [Genres]
}

