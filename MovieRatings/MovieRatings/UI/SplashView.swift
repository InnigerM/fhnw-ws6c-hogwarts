//
//  SplashView.swift
//  MovieRatings
//
//  Created by Marco Inniger on 01.06.20.
//  Copyright © 2020 FHNW. All rights reserved.
//

import SwiftUI

struct SplashView: View {
    
    @State var isActive:Bool = false
    
    var body: some View {
        VStack {
            if self.isActive {
                ContentView()
            } else {
                VStack {
                    Spacer()
                    Image("icons8-movie-projector-100")
                        .resizable()
                        .frame(width: 150, height: 150)
                    Text("Movie Database")
                    Spacer()
                }
                .frame(maxWidth: .infinity)
                .background(Color.yellow)
            }
        }
        .onAppear {
            DispatchQueue.main.asyncAfter(deadline: .now() + 2.5) {
                withAnimation {
                    self.isActive = true
                }
            }
        }
    }
    
}
