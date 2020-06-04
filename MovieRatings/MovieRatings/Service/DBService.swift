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
        
        let favourite = Favourites()
        
        favourite.title = movie.title
        favourite.voteAverage = movie.voteAverage
        favourite.originalLanguage = movie.originalLanguage
        favourite.overview = movie.overview
        favourite.releaseDate = movie.releaseDate
        
        if let backdropUnwrapped = movie.backdropPath {
            favourite.backdropPath = backdropUnwrapped
        } else  {
            favourite.backdropPath = nil
        }
        
        try! realm.write {
            realm.add(favourite)
        }
    }
    func readMoviesFromDatabase(completion: @escaping ([Movie]) -> ()){
        let favourites =  Array(realm.objects(Favourites.self))
        var movies = [Movie]()
        for favourite in favourites{
            let movie = Movie(popularity: Optional(nil),
                              voteCount: Optional(nil),
                              video: Optional(nil),
                              posterPath: Optional(nil),
                              id: Optional(nil),
                              adult: Optional(nil),
                              backdropPath: favourite.backdropPath,
                              originalLanguage:favourite.originalLanguage,
                              originalTitle: Optional(nil),
                              genreIDS: Optional(nil),
                              title: favourite.title,
                              voteAverage: favourite.voteAverage,
                              overview: favourite.overview,
                              releaseDate: favourite.releaseDate)
            
            movies.append(movie)
        }
        completion(movies)
    }
}
