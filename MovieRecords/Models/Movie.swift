//
//  Movie.swift
//  MovieRecords
//
//  Created by MAC on 20/01/23.
//

import Foundation

struct Movie {
    
    static let DUMMY = Movie(
        id: "tt0111161",
        rank: 1,
        title: "Shawshank redemption",
        year: "1994",
        imageUrl: "shawshank_poster",
        crew: "Frank Darabont (dir.), Tim Robbins, Morgan Freeman",
        description: "Over the course of several years, two convicts form a friendship, seeking consolation and, eventually, redemption trough basic compassion.",
        imdbRating: 9.2,
        rating: 9,
        favorite: true)
    
    var id: String
    var rank: Int
    var title: String
    var year: String
    var imageUrl: String
    var crew: String
    var description: String
    var imdbRating: Float
    var rating: Int
    var favorite: Bool
}
