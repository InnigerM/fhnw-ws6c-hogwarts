//
//  Results.swift
//  MovieRatings
//
//  Created by Pascal Andermatt on 22.05.20.
//  Copyright © 2020 FHNW. All rights reserved.
//

import Foundation

//generated with https://app.quicktype.io/

 struct Results: Codable {
     let page, totalResults, totalPages: Int
     let movies: [Movie]

     enum CodingKeys: String, CodingKey {
         case page
         case totalResults = "total_results"
         case totalPages = "total_pages"
         case movies = "results"
     }
 }
