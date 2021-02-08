//
//  DetailView.swift
//  BerkayKara
//
//  Created by Berkay KARA on 8.02.2021.
//

import Kingfisher
import SwiftUI

struct DetailView: View {
    
    let collection: Result
    
    let dataType: ContentTypeEnums
    
    @ObservedObject var viewModel = ViewModel()
        
    var body: some View {
        
        ScrollView{
            LazyVGrid(columns: [
                GridItem(.flexible(minimum: 100, maximum: UIScreen.main.bounds.width * 70/100), spacing: 1, alignment: .center)
            ], alignment: .center, spacing: 1,  content: {
                VStack (alignment: .leading, spacing: 4){
                    KFImage(URL(string: collection.artworkUrl100 ?? viewModel.genericMessage))
                        .resizable()
                        .scaledToFit()
                        .cornerRadius(22)
                    Spacer()
                }
            })
            
            let date = viewModel.dateFormat(date: collection.releaseDate ?? viewModel.genericMessage)
            
            
            switch dataType {
            case .Movie:
                HStack{
                    Text("Movie Name:").font(.system(size: 20, weight: .semibold)).id(UUID())
                    Text(collection.name ?? viewModel.genericMessage).font(.system(size: 18, weight: .regular)).id(UUID())
                }.padding(.top, 10).padding(.horizontal, 20)
                HStack{
                    Text("Artist Name:").font(.system(size: 20, weight: .semibold)).id(UUID())
                    Text(collection.artistName ?? viewModel.genericMessage).font(.system(size: 18, weight: .regular)).id(UUID())
                }.padding(.top, 10).padding(.horizontal, 20)
                HStack{
                    Text("Movie Type:").font(.system(size: 20, weight: .semibold)).id(UUID())
                    Text(viewModel.getGenres(genres: collection.genres)).font(.system(size: 18, weight: .regular)).id(UUID())
                }.padding(.top, 10).padding(.horizontal, 20)
                
            case .Music:
                HStack{
                    Text("Music Name:").font(.system(size: 20, weight: .semibold)).id(UUID())
                    Text(collection.name ?? viewModel.genericMessage).font(.system(size: 18, weight: .regular)).id(UUID())
                }.padding(.top, 10).padding(.horizontal, 20)
                HStack{
                    Text("Album Name:").font(.system(size: 20, weight: .semibold)).id(UUID())
                    Text(collection.collectionName ?? viewModel.genericMessage).font(.system(size: 18, weight: .regular)).id(UUID())
                }.padding(.top, 10).padding(.horizontal, 20)
                HStack{
                    Text("Artist Name:").font(.system(size: 20, weight: .semibold)).id(UUID())
                    Text(collection.artistName ?? viewModel.genericMessage).font(.system(size: 18, weight: .regular)).id(UUID())
                }.padding(.top, 10).padding(.horizontal, 20)
                HStack{
                    Text("Release Date:").font(.system(size: 20, weight: .semibold)).id(UUID())
                    Text("\(date)").font(.system(size: 18, weight: .regular)).id(UUID())
                }.padding(.top, 10).padding(.horizontal, 20)
                HStack{
                    Text("Music Type:").font(.system(size: 20, weight: .semibold)).id(UUID())
                    Text(viewModel.getGenres(genres: collection.genres)).font(.system(size: 18, weight: .regular)).id(UUID())
                }.padding(.top, 10).padding(.horizontal, 20)
            case .App:

                HStack{
                    Text("App Name:").font(.system(size: 20, weight: .semibold)).id(UUID())
                    Text(collection.name ?? viewModel.genericMessage).font(.system(size: 18, weight: .regular)).id(UUID())
                }.padding(.top, 10).padding(.horizontal, 20)
                HStack{
                    Text("Release Date:").font(.system(size: 20, weight: .semibold)).id(UUID())
                    Text(date).font(.system(size: 18, weight: .regular)).id(UUID())
                }.padding(.top, 10).padding(.horizontal, 20)
                HStack{
                    Text("App Type:").font(.system(size: 20, weight: .semibold)).id(UUID())
                    Text(viewModel.getGenres(genres: collection.genres)).font(.system(size: 18, weight: .regular)).id(UUID())
                }.padding(.top, 10).padding(.horizontal, 20)
                HStack{
                    Text("Copyright:").font(.system(size: 20, weight: .semibold)).id(UUID())
                    Text(collection.copyright ?? viewModel.genericMessage).font(.system(size: 18, weight: .regular)).id(UUID())
                }.padding(.top, 10).padding(.horizontal, 20)

            case .Book:
                
                HStack{
                    Text("Book Name:").font(.system(size: 20, weight: .semibold)).id(UUID())
                    Text(collection.name ?? viewModel.genericMessage).font(.system(size: 18, weight: .regular)).id(UUID())
                }.padding(.top, 10).padding(.horizontal, 20)
                HStack{
                    Text("Artist Name:").font(.system(size: 20, weight: .semibold)).id(UUID())
                    Text(collection.artistName ?? viewModel.genericMessage).font(.system(size: 18, weight: .regular)).id(UUID())
                }.padding(.top, 10).padding(.horizontal, 20)
                HStack{
                    Text("Release Date:").font(.system(size: 20, weight: .semibold)).id(UUID())
                    Text(date).font(.system(size: 18, weight: .regular)).id(UUID())
                }.padding(.top, 10).padding(.horizontal, 20)
                HStack{
                    Text("Book Type:").font(.system(size: 20, weight: .semibold)).id(UUID())
                    Text(viewModel.getGenres(genres: collection.genres)).font(.system(size: 18, weight: .regular)).id(UUID())
                }.padding(.top, 10).padding(.horizontal, 20)
            }
            
            
       
       }
        CustomButtonView(collectionURL: collection.url ?? viewModel.genericMessage, type: "movie").padding(.bottom, 10)
    }
}
