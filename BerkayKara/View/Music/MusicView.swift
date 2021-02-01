//
//  MusicView.swift
//  BerkayKara
//
//  Created by Berkay KARA on 16.01.2021.
//

import SwiftUI
import Kingfisher

struct MusicView: View {
    
    let collection: MusicResult
    
    var body: some View {
        VStack (alignment: .leading, spacing: 4){
            
            NavigationLink(destination: MusicDetailView(collection: collection)) {
                KFImage(URL(string: collection.artworkUrl100))
                    .resizable()
                    .scaledToFit()
                    .cornerRadius(22)
            }
            
            Text(collection.name).font(.system(size: 16, weight: .semibold)).padding(.top, 4).id(UUID())
            Text(collection.artistName).font(.system(size: 16, weight: .regular)).padding(.top, 4).id(UUID())
            Spacer()
        }
    }
}
