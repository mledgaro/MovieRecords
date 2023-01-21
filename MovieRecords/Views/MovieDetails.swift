//
//  MovieDetails.swift
//  MovieRecords
//
//  Created by MAC on 20/01/23.
//

import SwiftUI

struct MovieDetails: View {
    
    var movie: Movie
    
    var body: some View {
        
        VStack {
            
            Text(movie.title)
                .font(.largeTitle)
            
            Text(movie.year)
            
            
            
            Image(movie.imageUrl)
                .resizable()
                .padding(/*@START_MENU_TOKEN@*/.all, 30.0/*@END_MENU_TOKEN@*/)
                .scaledToFit()
            
            
            
            Text(movie.crew)
                .multilineTextAlignment(.center)
            
            Text(movie.description)
                .multilineTextAlignment(.leading)
                .padding(.all, 5.0)
            
            Text("IMDb rating: \(movie.imdbRating)")
            
            Text("Your rating")
            HStack {
                Image(systemName: "star")
                Image(systemName: "star")
                Image(systemName: "star")
                Image(systemName: "star")
                Image(systemName: "star")
            }
            
            
            
        }
        
    }
}

struct MovieDetails_Previews: PreviewProvider {
    static var previews: some View {
        MovieDetails(movie: Movie.DUMMY)
    }
}
