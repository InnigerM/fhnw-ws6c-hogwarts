//
//  TheMoviedbAPI.swift
//  MovieRatings
//
//  Created by Pascal Andermatt on 22.05.20.
//  Copyright © 2020 FHNW. All rights reserved.
//

import Foundation
import Moya

enum TheMovieDB_Api {
    case recommended(id:Int)
    case popular(page:Int)
    case newMovies(page:Int)
    case video(id:Int)
    case actor(ids:[Int])
    case upcoming(page:Int)
    case search(query:String)
}

extension TheMovieDB_Api: TargetType {
    
    private static let APIKey = "a05d1055562be71cfb3f61031510980a"
    
    var baseURL: URL {
        guard let url = URL(string: "https://api.themoviedb.org/3/") else {
            fatalError("baseURL could not be configured.")}
        return url
    }
    
    var path: String {
        switch self {
        case .recommended(let id):
            return "movie/\(id)/recommendations"
        case .popular:
            return "movie/popular"
        case .newMovies:
            return "movie/now_playing"
        case .video(let id):
            return "movie/\(id)/videos"
        case .actor:
            return "discover/movie"
        case .upcoming:
            return "movie/upcoming"
        case .search:
            return "search/movie"
        }
    }
    
    var method: Moya.Method {
        return .get
    }
    
    var sampleData: Data {
        return Data()
    }
    
    var task: Task {
        switch self {
        case .recommended, .video:
            return .requestParameters(parameters: ["api_key":  TheMovieDB_Api.APIKey], encoding: URLEncoding.queryString)
        case .popular(let page), .newMovies(let page), .upcoming(let page):
            return .requestParameters(parameters: ["page":page, "api_key": TheMovieDB_Api.APIKey], encoding: URLEncoding.queryString)
        case .actor(let ids):
            let params = ids.map({"\($0)"}).joined(separator: ",")
            return .requestParameters(parameters: ["api_key": TheMovieDB_Api.APIKey, "with_people": params], encoding: URLEncoding.queryString)
        case .search(let query):
            return .requestParameters(parameters: ["api_key": TheMovieDB_Api.APIKey, "query": query], encoding: URLEncoding.queryString)
        }
    }
    
    var headers: [String : String]? {
        return ["Content-type": "application/json"]
    }
    
}

