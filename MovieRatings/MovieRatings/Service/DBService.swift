//
//  DBService.swift
//  MovieRatings
//
//  Created by Marco Inniger on 30.05.20.
//  Copyright © 2020 FHNW. All rights reserved.
//

import Foundation
import RealmSwift
class DB_Service{
    
    let realm = try! Realm()
    
    init() {
        print(Realm.Configuration.defaultConfiguration.fileURL?.absoluteString ?? "realm config not found")
    }
    
    func saveMovie(movie: Favourites){
        let favourite = Favourites()
        
        favourite.title = movie.title
        favourite.voteAverage = movie.voteAverage
        
        try! realm.write {
            realm.add(favourite)
        }
    }
}
