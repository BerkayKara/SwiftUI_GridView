//
//  MusicDetailView.swift
//  BerkayKara
//
//  Created by Berkay KARA on 26.01.2021.
//

import Kingfisher
import SwiftUI

struct MusicDetailView: View {
    
    let collection: MusicResult
    
    @ObservedObject var viewModel = ViewModel()
    
    var body: some View {
        
        ScrollView{
            LazyVGrid(columns: [
                GridItem(.flexible(minimum: 100, maximum: UIScreen.main.bounds.width * 70/100), spacing: 1, alignment: .center)
            ], alignment: .center, spacing: 1,  content: {
                VStack (alignment: .leading, spacing: 4){
                    KFImage(URL(string: collection.artworkUrl100))
                        .resizable()
                        .scaledToFit()
                        .cornerRadius(22)
                    Spacer()
                }
            })
            HStack{
                Text("Music Name:").font(.system(size: 20, weight: .semibold)).id(UUID())
                Text(collection.name).font(.system(size: 18, weight: .regular)).id(UUID())
            }.padding(.top, 10).padding(.horizontal, 20)
            HStack{
                Text("Album Name:").font(.system(size: 20, weight: .semibold)).id(UUID())
                Text(collection.collectionName).font(.system(size: 18, weight: .regular)).id(UUID())
            }.padding(.top, 10).padding(.horizontal, 20)
            HStack{
                Text("Artist Name:").font(.system(size: 20, weight: .semibold)).id(UUID())
                Text(collection.artistName).font(.system(size: 18, weight: .regular)).id(UUID())
            }.padding(.top, 10).padding(.horizontal, 20)
            HStack{
                Text("Music Type:").font(.system(size: 20, weight: .semibold)).id(UUID())
                Text(viewModel.getGenres(genres: collection.genres)).font(.system(size: 18, weight: .regular)).id(UUID())
            }.padding(.top, 10).padding(.horizontal, 20)
            Spacer()
        }
        CustomButtonView(collectionURL: collection.url, type: "music").padding(.bottom, 10)
    }
}