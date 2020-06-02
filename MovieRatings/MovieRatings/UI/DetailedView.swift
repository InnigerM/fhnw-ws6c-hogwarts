//
//  DetailedView.swift
//  MovieRatings
//
//  Created by user on 27.05.20.
//  Copyright © 2020 FHNW. All rights reserved.
//

import SwiftUI
import Kingfisher

struct DetailsView: SwiftUI.View {
    private let dbService = DB_Service()
    @State var exists = false;
    var element: Movie;
    
    var body: some SwiftUI.View {
        ScrollView{
            VStack{
                KFImage(element.fullPosterURL)
                    .renderingMode(.original)
                    .resizable()
//                    .padding(.all)
                    .frame(height:250)
                HStack{
                    Text(element.title)
                        .fontWeight(.bold)
                        .padding(.leading)
                        .font(.title)
                    Spacer()
                    Button(action: {
                        self.exists = self.dbService.findMovie(movieTitle: self.element.title)
                        if (self.exists){
                            self.dbService.deleteMovie(movieTitle: self.element.title)
                        }
                        else{
                            self.dbService.saveMovie(movie: self.element)
                            //saveMovie => exists = false
                        }
                    }){
                        if(!exists){
                            Image(systemName:"bookmark.fill")
                        } else{
                            Image(systemName:"bookmark")
                        }
                    }
                    .font(.title)
                    .padding(.trailing)
                    .foregroundColor(.yellow)
                }
                HStack{
                    RatingViewDetailed(rating: Int(element.voteAverage))
                        .padding()
                        .padding(.bottom, 15)
                }
                HStack{
                    Text("Release-Date: " + element.releaseDate)
                        .padding(.leading, 20)
                        .padding(.bottom, 15)
                    Spacer()
                }
                HStack{
                    Text("Original language: " + element.originalLanguage)
                        .padding(.leading, 20)
                        .padding(.bottom, 20)
                    Spacer()
                }
                HStack{
                    Text("Storyline")
                        .fontWeight(.bold)
                        .padding()
                    Spacer()
                }
                
                Text(element.overview)
                    .padding()
                Spacer()
            }
        }
        .navigationBarHidden(true)
    }
}
