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
//    var vote : Int;
    
    var body: some SwiftUI.View {
        List {
            ForEach(viewModel.movies) { movie in
                HStack{
                    KFImage(movie.fullPosterURL)
                        .cancelOnDisappear(true)
                        .resizable()
                        .frame(height: 100)
                        .frame(width: 100)
                    VStack(alignment: .leading, spacing: 20) {
                        Text(movie.title)
                        Text(String(format:"%.1f", movie.voteAverage))
//                        RatingView(rating: vote)
                    }
                    Spacer()
                    Image(systemName: "chevron.right")
                }
            }
        }
    }
}
