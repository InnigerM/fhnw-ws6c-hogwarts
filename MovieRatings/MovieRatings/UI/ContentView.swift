//
//  ContentView.swift
//  MovieRatings
//
//  Created by Marco Inniger on 22.05.20.
//  Copyright © 2020 FHNW. All rights reserved.
//

import SwiftUI


struct ContentView: SwiftUI.View {
    
    @ObservedObject var viewModel = MovieViewModel()
    
    var body: some SwiftUI.View {
       VStack {
        ForEach(viewModel.movies) { movie in
            HStack{
                VStack { Text(movie.title) // arange sub view in vertical
                    HStack { Text(String(format:"%.1f", movie.voteAverage))
                   }
                 }
              }
          }
       }
    }
}
