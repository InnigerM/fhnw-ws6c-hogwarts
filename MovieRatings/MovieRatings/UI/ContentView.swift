//
//  ContentView.swift
//  MovieRatings
//
//  Created by Marco Inniger on 22.05.20.
//  Copyright © 2020 FHNW. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    
    @ObservedObject var viewModel = MovieViewModel()
    
    var body: some View {
       VStack {
        ForEach(viewModel.movies) { movie in
               Text("Result: \(movie.title)")
           }
       }
    }
}
