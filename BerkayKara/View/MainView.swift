//
//  MainView.swift
//  BerkayKara
//
//  Created by Berkay KARA on 26.01.2021.
//

import SwiftUI

struct MainView: View {
    
    @State private var typeSelection = 0
    @State private var searchText : String = ""
    @State private var isSearching = false
    var typeSelections = ["Movies", "Music", "Apps", "Books"] //for picker view
    var arrays = ["movies", "music", "apps", "books"] // for arrays
    
    var navTitle = ["Search in Movies", "Search in Musics", "Search in Apps", "Search in Books"]
    
    
    @ObservedObject var viewModel = ViewModel()
    
    var body: some View {
        NavigationView{
            ScrollView{
                //MARK:Search bar
                HStack {
                    HStack {
                        TextField("Search...", text: $searchText)
                            .padding(.leading, 24)
                    }
                    .padding()
                    .background(Color(.systemGray5))
                    .cornerRadius(8)
                    .padding(.horizontal)
                    .onTapGesture {
                        isSearching.toggle()
                    }
                    .overlay(
                        HStack {
                            Image(systemName: "magnifyingglass")
                            Spacer()
                           // if !isSearching {
                                Button(action: { searchText = "" }, label: {
                                    Image(systemName: "xmark.circle.fill")
                                        .padding(.vertical)
                                })
                           // }
                        }
                        .padding(.horizontal, 32)
                        .foregroundColor(.gray)
                    )//.transition(.move(edge: .trailing))
                    //.animation(.spring())
                    
                    /*if isSearching {
                        Button(action: {
                            isSearching.toggle()
                            searchText = ""
                            UIApplication.shared.sendAction(#selector(UIApplication.resignFirstResponder), to: nil, from: nil, for: nil)
                        }, label: {
                            Text("Cancel")
                                .padding(.trailing)
                                .padding(.leading, 0)
                        })
                        .transition(.move(edge: .trailing))
                        .animation(.spring())
                    }*/
                    
                    Spacer()
                }
                //MARK: Segmented Control
                Picker(selection: $typeSelection, label: Text("")) {
                    ForEach(0..<typeSelections.count) { index in
                        Text(self.typeSelections[index]).tag(index)
                    }
                }
                .pickerStyle(SegmentedPickerStyle()).padding(.horizontal, 18)
                
                //MARK: Grid View
                LazyVGrid(columns: [
                    GridItem(.flexible(minimum: 100, maximum: 200), spacing: 16, alignment: .top),
                    GridItem(.flexible(minimum: 100, maximum: 200), spacing: 16, alignment: .top)
                ], alignment: .leading, spacing: 16,  content: {
                    
                    
                    switch typeSelection {
                    case 0:
                        ForEach(viewModel.movies.filter({
                            "\($0)".contains(searchText) || searchText.isEmpty
                        }), id: \.self) { collection in
                            ContentView(collection: collection, dataType: ContentTypeEnums.Movie).animation(/*@START_MENU_TOKEN@*/.easeIn/*@END_MENU_TOKEN@*/)
                        }
                    case 1:
                        ForEach(viewModel.musics.filter({
                            "\($0)".contains(searchText) || searchText.isEmpty
                        }), id: \.self) { collection in
                            ContentView(collection: collection, dataType: ContentTypeEnums.Music).animation(/*@START_MENU_TOKEN@*/.easeIn/*@END_MENU_TOKEN@*/)
                        }
                    case 2:
                        ForEach(viewModel.applications.filter({
                            "\($0)".contains(searchText) || searchText.isEmpty
                        }), id: \.self) { collection in
                            ContentView(collection: collection, dataType: ContentTypeEnums.App).animation(/*@START_MENU_TOKEN@*/.easeIn/*@END_MENU_TOKEN@*/)
                        }
                    case 3:
                        ForEach(viewModel.books.filter({
                            "\($0)".contains(searchText) || searchText.isEmpty
                        }), id: \.self) { collection in
                            ContentView(collection: collection, dataType: ContentTypeEnums.Book).animation(/*@START_MENU_TOKEN@*/.easeIn/*@END_MENU_TOKEN@*/)
                        }
                    default:
                        ForEach(viewModel.movies.filter({
                            "\($0)".contains(searchText) || searchText.isEmpty
                        }), id: \.self) { collection in
                            ContentView(collection: collection, dataType: ContentTypeEnums.Movie).animation(/*@START_MENU_TOKEN@*/.easeIn/*@END_MENU_TOKEN@*/)
                        }
                        
                    }
                    
                    
                }).padding(.horizontal).padding(.top,20)
            }.navigationTitle(navTitle[typeSelection])
        }
    }
}



struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        MainView()
    }
}

