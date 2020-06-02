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
    @Binding var search : String
    
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
                    self.state = "Search"
                    self.viewModel.searchMovies(query: self.search)
                }){
                    if(self.state == "Search"){
                        Image(systemName: "heart.fill")
                        Text("Favourite")
                    } else {
                        Image(systemName: "heart")
                        Text("Favourite")
                    }
                }.buttonStyle(BorderlessButtonStyle())
            }
        }
    }
}
