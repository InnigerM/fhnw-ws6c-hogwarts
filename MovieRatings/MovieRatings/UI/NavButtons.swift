//
//  SwiftUIView.swift
//  MovieRatings
//
//  Created by Marco Inniger on 02.06.20.
//  Copyright © 2020 FHNW. All rights reserved.
//

import SwiftUI

struct NavButtons: View {
    @ObservedObject var viewModel: MovieViewModel
    @Binding var state : String
    private let dbService = DB_Service()
    
    var body: some View {
        HStack{
            VStack{
                Button(action: {
                    self.state = "Popular"
                    self.viewModel.loadNewMovies()
                }){
                    if(self.state == "Popular"){
                        Image(systemName: "person.3.fill")
                        Text("Popular")
                         .fontWeight(.semibold)
                    } else {
                        Image(systemName: "person.3")
                        Text("Popular")
                    }
                }.buttonStyle(BorderlessButtonStyle())
            }
            Divider()
            Spacer()
            VStack{
                Button(action: {
                    self.state = "Upcoming"
                    self.viewModel.loadUpcomingMovies()
                }){
                    if(self.state == "Upcoming") {
                        Image(systemName: "cloud.sun.fill")
                        Text("Upcoming")
                         .fontWeight(.semibold)
                    } else {
                        Image(systemName: "cloud.sun")
                        Text("Upcoming")
                    }
                }.buttonStyle(BorderlessButtonStyle())
            }
            Spacer()
            Divider()
            VStack{
                Button(action: {
                    self.state = "Favourite"
                    let movies = self.dbService.readMoviesFromDatabase()
                    self.viewModel.updateMovies(favourites: movies)
                }){
                    if(self.state == "Favourite"){
                        Image(systemName: "heart.fill")
                        Text("Favourite")
                         .fontWeight(.semibold)
                    } else {
                        Image(systemName: "heart")
                        Text("Favourite")
                    }
                }.buttonStyle(BorderlessButtonStyle())
            }
        }
    }
}
