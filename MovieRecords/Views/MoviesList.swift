//
//  MoviesList.swift
//  MovieRecords
//
//  Created by MAC on 20/01/23.
//

import SwiftUI

struct MoviesList: View {
    
    var body: some View {
        
        VStack {
            
            Spacer()
            
            Text("Top 250")
                .font(.largeTitle)
            
            List {
                MovieListItem(movie: .constant(Movie.DUMMY))
                MovieListItem(movie: .constant(Movie.DUMMY))
                MovieListItem(movie: .constant(Movie.DUMMY))
                MovieListItem(movie: .constant(Movie.DUMMY))
                MovieListItem(movie: .constant(Movie.DUMMY))
                MovieListItem(movie: .constant(Movie.DUMMY))
                MovieListItem(movie: .constant(Movie.DUMMY))
                MovieListItem(movie: .constant(Movie.DUMMY))
                MovieListItem(movie: .constant(Movie.DUMMY))
                MovieListItem(movie: .constant(Movie.DUMMY))
            }
        }
    }
}

struct MoviesList_Previews: PreviewProvider {
    static var previews: some View {
        MoviesList()
    }
}
