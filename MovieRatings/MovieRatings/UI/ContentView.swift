//
//  ContentView.swift
//  MovieRatings
//
//  Created by Marco Inniger on 22.05.20.
//  Copyright © 2020 FHNW. All rights reserved.
//
import Kingfisher
import SwiftUI


struct ContentView: SwiftUI.View {
    
    @ObservedObject var viewModel = MovieViewModel()
    private let dbService = DB_Service()
    
    init() {
        var myFav = Favourites()
        
        myFav.title = "test title"
        myFav.voteAverage = 6.5
        
        dbService.saveMovie(movie: myFav)
        
    }
    
    var body: some SwiftUI.View {
        NavigationView{
            List {
                ForEach(viewModel.movies) { movie in
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
                    .navigationBarTitle("Upcoming Movies")
                }
            }
        }
        .navigationBarHidden(true)
    }
    
}
