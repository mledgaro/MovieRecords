//
//  MoviesList.swift
//  MovieRecords
//
//  Created by MAC on 20/01/23.
//

import SwiftUI

struct MoviesList: View {
    
    var movies = Array(repeating: MovieListItem(favorite: true), count: 10)
    
    var body: some View {
        
        VStack {
            
            Spacer()
            
            Text("Top 250")
                .font(.largeTitle)
            
            List {
                MovieListItem(favorite: false)
                MovieListItem(favorite: false)
                MovieListItem(favorite: false)
                MovieListItem(favorite: false)
                MovieListItem(favorite: false)
            }
        }
    }
}

struct MoviesList_Previews: PreviewProvider {
    static var previews: some View {
        MoviesList()
    }
}
