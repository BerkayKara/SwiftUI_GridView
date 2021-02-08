//
//  ContentView.swift
//  BerkayKara
//
//  Created by Berkay KARA on 8.02.2021.
//


import SwiftUI
import Kingfisher

struct ContentView: View {
    
    let collection: Result
    
    let dataType: ContentTypeEnums
        
    let viewModel = ViewModel()
    
    var body: some View {
        VStack (alignment: .leading, spacing: 4){
            
            NavigationLink(destination: DetailView(collection: collection, dataType: dataType)) {
                KFImage(URL(string: collection.artworkUrl100 ?? viewModel.genericMessage))
                    .resizable()
                    .scaledToFit()
                    .cornerRadius(22)
            }
            
            let date = viewModel.dateFormat(date: collection.releaseDate ?? viewModel.genericMessage)
            
            Text(collection.name ?? viewModel.genericMessage).font(.system(size: 16, weight: .semibold)).padding(.top, 4).id(UUID())
            Text(date).font(.system(size: 12, weight: .regular)) .id(UUID())
            if dataType == ContentTypeEnums.Movie || dataType == ContentTypeEnums.Music || dataType == ContentTypeEnums.Book {
                
                Text(collection.artistName ?? viewModel.genericMessage).font(.system(size: 16, weight: .regular)).padding(.top, 4).id(UUID())
               
            }
            else if dataType == ContentTypeEnums.App {
                Text(collection.copyright ?? viewModel.genericMessage).font(.system(size: 10, weight:.regular)).foregroundColor(.gray).id(UUID())
            }
            
            
            
            Spacer()
        }
    }
}
