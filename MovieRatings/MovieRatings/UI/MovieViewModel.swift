//
//  MovieModel.swift
//  MoyaExampleSwiftUI
//
//  Created by Oliver Gepp on 04.02.20.
//  Copyright © 2020 fhnw mobile workshop. All rights reserved.
//

import Foundation
import SwiftUI

class MovieViewModel: ObservableObject{
    
    private let provider: NetworkManager?
    
    @Published var movies = [Movie]()
    
    init(provider: NetworkManager? = NetworkManager(), movies: [Movie] = []) {
        self.provider = provider
        self.movies = movies

        loadNewMovies()
    }
    
    func loadNewMovies(){
        return (provider?.getPopularMovies(page: 1) {[weak self] movies in
            print("\(movies.count) new movies loaded")
            self?.movies.removeAll()
            self?.movies.append(contentsOf: movies)})!
    }
    
    func loadUpcomingMovies(){
        return (provider?.getUpcomingMovies(page: 1) {[weak self] movies in
            print("\(movies.count) new movies loaded")
            self?.movies.removeAll()
            self?.movies.append(contentsOf: movies)})!
    }
    
    func searchMovies(query: String){
        return (provider?.getQueriedMovies(query: query) {[weak self] movies in
            print("\(movies.count) new movies loaded")
            self?.movies.removeAll()
            self?.movies.append(contentsOf: movies)})!
    }
    
    func updateMovies(movies:[Movie]) {
        self.movies.removeAll()
        self.movies.append(contentsOf: movies)
    }
}
