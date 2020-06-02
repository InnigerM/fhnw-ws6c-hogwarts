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
    
    func deleteMovie(movieTitle:String) {
        let objectToDelete = realm.objects(Favourites.self).filter("title = '\(movieTitle)'")
        try! realm.write {
            realm.delete(objectToDelete)
        }
    }
    
    func findMovie(movieTitle: String) -> Bool {
        let movie = realm.objects(Favourites.self).filter("title = '\(movieTitle)'")
        return !movie.isEmpty;
    }
    
    func saveMovie(movie: Movie){
        var backdropUnwrapped = "https://ukmoths.org.uk/site/templates/includes/images/noimageyet420.png"
        if ((movie.backdropPath) != nil) {
             backdropUnwrapped = "https://image.tmdb.org/t/p/w500"
        }
        
        let favourite = Favourites()
        
        favourite.title = movie.title
        favourite.voteAverage = movie.voteAverage
        //favourite.backdropPath = backdropUnwrapped
        favourite.originalLanguage = movie.originalLanguage
        favourite.overview = movie.overview
        favourite.releaseDate = movie.releaseDate
        
        try! realm.write {
            realm.add(favourite)
        }
    }
    func readMoviesFromDatabase() -> [Movie]{
        let favourites =  Array(realm.objects(Favourites.self))
        var movies = [Movie]()
        for favourite in favourites{
            let movie = Movie(popularity: nil,
                              voteCount: nil,
                              video: nil,
                              posterPath: nil,
                              id: nil,
                              adult: nil,
                              backdropPath: nil,
                              originalLanguage:favourite.originalLanguage,
                              originalTitle:nil ,
                              genreIDS: nil,
                              title: favourite.title ,
                              voteAverage: favourite.voteAverage,
                              overview: favourite.overview,
                              releaseDate: favourite.releaseDate)
            
            movies.append(movie)
        }
        return movies;
    }
}
