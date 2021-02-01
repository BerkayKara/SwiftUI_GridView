//
//  AppDetailView.swift
//  BerkayKara
//
//  Created by Berkay KARA on 26.01.2021.
//

import Kingfisher
import SwiftUI

struct AppDetailView: View {
    
    let collection: AppResult
    
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
                Text("App Name:").font(.system(size: 20, weight: .semibold)).id(UUID())
                Text(collection.name).font(.system(size: 18, weight: .regular)).id(UUID())
            }.padding(.top, 10).padding(.horizontal, 20)
            HStack{
                Text("Release Date:").font(.system(size: 20, weight: .semibold)).id(UUID())
                Text(collection.releaseDate).font(.system(size: 18, weight: .regular)).id(UUID())
            }.padding(.top, 10).padding(.horizontal, 20)
            HStack{
                Text("App Type:").font(.system(size: 20, weight: .semibold)).id(UUID())
                Text(viewModel.getGenres(genres: collection.genres)).font(.system(size: 18, weight: .regular)).id(UUID())
            }.padding(.top, 10).padding(.horizontal, 20)
            HStack{
                Text("Copyright:").font(.system(size: 20, weight: .semibold)).id(UUID())
                Text(collection.copyright).font(.system(size: 18, weight: .regular)).id(UUID())
            }.padding(.top, 10).padding(.horizontal, 20)
            Spacer()
        }
        CustomButtonView(collectionURL: collection.url, type: "app")
    }
}
