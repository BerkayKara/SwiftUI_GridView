//
//  ViewModel.swift
//  BerkayKara
//
//  Created by Berkay KARA on 10.01.2021.
//

import Foundation
import SwiftUI

class ViewModel:ObservableObject {
    
    @Published var movies = [MovieResult]()
    @Published var musics = [MusicResult]()
    @Published var applications = [AppResult]()
    @Published var books = [BookResult]()
    
    init(){
        getMovies()
        getMusics()
        getApplications()
        getBooks()
    }
    //MARK: Network Requests
    func getMovies(){
        guard let url = URL(string: "https://rss.itunes.apple.com/api/v1/us/movies/top-movies/all/50/explicit.json") else { return }
        URLSession.shared.dataTask(with: url) { (data, resp, err) in
            // check response status and err
            guard let data = data else { return }
            do {
                let rss = try JSONDecoder().decode(MovieRSS.self, from: data)
                print(rss)
                self.movies = rss.feed.results
            } catch {
                print("Failed to decode: \(error)")
            }
        }.resume()
    }
    
    func getMusics(){
        guard let url = URL(string: "https://rss.itunes.apple.com/api/v1/us/itunes-music/hot-tracks/all/50/explicit.json") else { return }
        URLSession.shared.dataTask(with: url) { (data, resp, err) in
            // check response status and err
            guard let data = data else { return }
            do {
                let rss = try JSONDecoder().decode(MusicRSS.self, from: data)
//                print(rss)
                self.musics = rss.feed.results
            } catch {
                print("Failed to decode: \(error)")
            }
        }.resume()
    }
    
    func getApplications(){
        guard let url = URL(string: "https://rss.itunes.apple.com/api/v1/us/ios-apps/new-apps-we-love/all/50/explicit.json") else { return }
        URLSession.shared.dataTask(with: url) { (data, resp, err) in
            // check response status and err
            guard let data = data else { return }
            do {
                let rss = try JSONDecoder().decode(AppRSS.self, from: data)
//                print(rss)
                self.applications = rss.feed.results
            } catch {
                print("Failed to decode: \(error)")
            }
        }.resume()
    }
    
    func getBooks(){
        guard let url = URL(string: "https://rss.itunes.apple.com/api/v1/us/books/top-paid/all/50/explicit.json") else { return }
        URLSession.shared.dataTask(with: url) { (data, resp, err) in
            // check response status and err
            guard let data = data else { return }
            do {
                let rss = try JSONDecoder().decode(BookRSS.self, from: data)
//                print(rss)
                self.books = rss.feed.results
            } catch {
                print("Failed to decode: \(error)")
            }
        }.resume()
    }
    
    
    //MARK: Other Functions
    
    func dateFormat(date:String) -> String {
        let dateFormatterGet = DateFormatter()
        dateFormatterGet.dateFormat = "yyyy-MM-dd'T'HH:mm:ssZ"
        
        let dateFormatterPrint = DateFormatter()
        dateFormatterPrint.dateFormat = "MMM dd,yyyy"
        
        let date: Date? = dateFormatterGet.date(from: "2018-02-01T19:10:04+00:00")
        print("Date",dateFormatterPrint.string(from: date!)) // Feb 01,2018
        return dateFormatterPrint.string(from: date!);
    }
    
    
    func numberFormat(num: Double) -> String {
        let formatted = String(format: "%.2f", num)
        print(num)
        return formatted
    }
    
    func getGenres(genres: [Genres]) -> String{
        var result = ""
        let count = genres.count
        for (index, item) in genres.enumerated() {
            result.append(item.name)
            index != count - 1 ? result.append(", ") : result.append(".")
        }
        return result
    }
        
}
