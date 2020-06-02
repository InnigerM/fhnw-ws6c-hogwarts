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
    @State var clicked: Bool = false;
    var element: Movie;
    
    var body: some SwiftUI.View {
        ScrollView{
            VStack{
                KFImage(element.fullPosterURL)
                    .renderingMode(.original)
                    .resizable()
                    .padding(.all)
                    .frame(height:250)
                HStack{
                    Text(element.title)
                        .fontWeight(.bold)
                        .padding(.leading)
                        .font(.title)
                    Spacer()
                    Button(action: {
                        self.clicked = !self.clicked;
                    }){
                        if(clicked == true){
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
                    Spacer()
                }
                HStack{
                    Text("Release-Date: " + element.releaseDate)
                        .padding()
                    Spacer()
                }
                HStack{
                    Text("Original language: " + element.originalLanguage)
                        .padding()
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
