//
//  MovieDetails.swift
//  MovieRecords
//
//  Created by MAC on 20/01/23.
//

import SwiftUI

struct MovieDetails: View {
    var body: some View {
        
        VStack {
            Text("Shawshank redemption")
                .font(.largeTitle)
            
            Text("1994")
            
            
            
            Image("shawshank_poster")
                .resizable()
                .padding(/*@START_MENU_TOKEN@*/.all, 30.0/*@END_MENU_TOKEN@*/)
                .scaledToFit()
            
            
            
            Text("Frank Darabont (dir.), Tim Robbins, Morgan Freeman")
                .multilineTextAlignment(.center)
            
            Text("Over the course of several years, two convicts form a friendship, seeking consolation and, eventually, redemption trough basic compassion.")
                .multilineTextAlignment(.leading)
                .padding(.all, 5.0)
            
            Text("IMDb rating: 9.2")
            
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
        MovieDetails()
    }
}
