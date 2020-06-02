//
//  ContentView.swift
//  MovieRatings
//
//  Created by Marco Inniger on 22.05.20.
//  Copyright © 2020 FHNW. All rights reserved.
//
import Kingfisher
import SwiftUI
import Foundation


struct ContentView: SwiftUI.View {
    
    @ObservedObject var viewModel = MovieViewModel()
    private let dbService = DB_Service()
    @State private var search = ""
    @State private var state = "Popular"
    @State var clicked: Bool = false;
    
    init() {
        let myFav = Favourites()
        
        myFav.title = "test title"
        myFav.voteAverage = 6.5
        
        //dbService.saveMovie(movie: myFav)
        
    }
    
    var body: some SwiftUI.View {
        NavigationView{
            List {
                HStack{
                    SearchBar(text: $search)
                    Button(action: {
                        self.viewModel.searchMovies(query: self.search)
                        self.state = "search"
                    }){
                        Image(systemName: "paperplane.fill")
                    }
                        //                    Button(action:{
                        //                        self.clicked = !self.clicked;
                        //                        //                        let movies = self.dbService.readMoviesFromDatabase()
                        //                        //                        self.viewModel.updateMovies(movies: movies)
                        //                    }){
                        //                        if(self.clicked == true){
                        //                            Image(systemName:"bookmark.fill")
                        //                        } else{
                        //                            Image(systemName:"bookmark")
                        //                        }
                        //                    }
                        .font(.title)
                        .padding(.trailing)
                        .foregroundColor(.yellow)
                }
                
                NavButtons(viewModel: viewModel, state: $state, search: $search)
                
                ForEach(viewModel.movies.filter { self.search.isEmpty ?  true : $0.title.localizedCaseInsensitiveContains(self.search)}) { movie in
                    NavigationLink(destination: DetailsView(element: movie)){
                        HStack{
                            KFImage(movie.fullPosterURL)
                                .cancelOnDisappear(true)
                                .resizable()
                                .frame(height: 100)
                                .frame(width: 130)
                                .cornerRadius(5)
                            VStack(alignment: .leading, spacing: 20) {
                                Text(movie.title)
                                RatingView(rating: Int(movie.voteAverage / 2))
                            }
                            Spacer()
                        }
                    }
                    .navigationBarTitle("\(self.state) Movies")
                }
            }
        }
        .navigationBarHidden(true)
    }
}
