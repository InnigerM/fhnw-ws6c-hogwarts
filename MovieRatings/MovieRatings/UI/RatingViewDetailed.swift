//
//  RatingViewDetailed.swift
//  MovieRatings
//
//  Created by Marco Inniger on 30.05.20.
//  Copyright © 2020 FHNW. All rights reserved.
//

import SwiftUI

struct RatingViewDetailed: View {
    var rating: Int
    
    var label = ""
    
    var maximumRating = 10
    
    var offImage: Image?
    var onImage = Image(systemName: "star.fill")
    
    var disabledColor = Color(red: 0.9, green: 0.9, blue: 0.9)
    var offColor = Color.gray
    var onColor = Color.yellow
    
    func image(for number: Int) -> Image {
        if number > rating {
            return offImage ?? onImage
        } else {
            return onImage
        }
    }
    
    var body: some View {
        HStack {
            if label.isEmpty == false {
                Text(label)
            }
            
            if(self.rating == 0) {
                ForEach(1..<maximumRating + 1) { number in
                    self.image(for: number)
                        .foregroundColor(self.disabledColor)
                }
            } else {
                ForEach(1..<maximumRating + 1) { number in
                    self.image(for: number)
                        .foregroundColor(number > self.rating ? self.offColor : self.onColor)
                }
            }
        }
    }
}

struct RatingViewDetailed_Previews: PreviewProvider {
    static var previews: some View {
        RatingView(rating: 4)
    }
}
