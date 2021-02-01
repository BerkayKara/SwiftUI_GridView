//
//  ContentView.swift
//  BerkayKara
//
//  Created by Berkay KARA on 9.01.2021.
//

import SwiftUI

struct ContentView: View {
    
    @State private var typeSelection = 0
    @State private var searchText : String = ""
    var typeSelections = ["Movies", "Music", "Apps", "Books"] //for picker view
    var arrays = ["movies", "music", "apps", "books"] // for arrays
    
    var navTitle = ["Search in Movies", "Search in Musics", "Search in Apps", "Search in Books"]
    
    
    @ObservedObject var viewModel = ViewModel()
    
    var body: some View {
        NavigationView{
            ScrollView{
                VStack {
                    HStack {
                        TextField("Search...", text: $searchText)
                            .padding(.leading, 24)
                    }
                    .padding()
                    .background(Color(.systemGray5))
                    .cornerRadius(8)
                    .padding(.horizontal)
                    .overlay(
                        HStack {
                            Image(systemName: "magnifyingglass")
                            Spacer()
                            Button(action: { searchText = "" }, label: {
                                Image(systemName: "xmark.circle.fill")
                                    .padding(.vertical)
                            })
                        }
                        .padding(.horizontal, 32)
                        .foregroundColor(.gray)
                    )
                    Spacer()
                }
                Picker(selection: $typeSelection, label: Text("")) {
                    ForEach(0..<typeSelections.count) { index in
                        Text(self.typeSelections[index]).tag(index)
                    }
                }
                .pickerStyle(SegmentedPickerStyle()).padding(.horizontal, 18)
                
                
                LazyVGrid(columns: [
                    GridItem(.flexible(minimum: 100, maximum: 200), spacing: 16, alignment: .top),
                    GridItem(.flexible(minimum: 100, maximum: 200), spacing: 16, alignment: .top)
                ], alignment: .leading, spacing: 16,  content: {
                    
                    
                    switch typeSelection {
                    case 0:
                        ForEach(viewModel.movies, id: \.self) { collection in
                            MovieView(collection: collection)
                        }
                    case 1:
                        ForEach(viewModel.musics, id: \.self) { collection in
                            MusicView(collection: collection)
                        }
                    case 2:
                        ForEach(viewModel.applications, id: \.self) { collection in
                            AppView(collection: collection)
                        }
                    case 3:
                        ForEach(viewModel.books, id: \.self) { collection in
                            BookView(collection: collection)
                        }
                    default:
                        ForEach(viewModel.applications, id: \.self) { collection in
                            AppView(collection: collection)
                        }
                        
                    }
                    
                    
                }).padding(.horizontal).onTapGesture {// bu şekilde detayı açılıcak
                }
            }.navigationTitle(navTitle[typeSelection])
        }
    }
}



struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
