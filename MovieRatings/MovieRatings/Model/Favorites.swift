//
//  Favorites.swift
//  MovieRatings
//
//  Created by Marco Inniger on 30.05.20.
//  Copyright © 2020 FHNW. All rights reserved.
//

import Foundation
import RealmSwift
public class Favourites: Object{
    
    @objc dynamic var title: String = ""
    @objc dynamic var voteAverage: Double = 0.0
}
