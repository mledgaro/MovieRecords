//
//  MovieListItem.swift
//  MovieRecords
//
//  Created by MAC on 20/01/23.
//

import SwiftUI

struct MovieListItem: View {
    
    @State var favorite: Bool
    
    var body: some View {
        
        HStack(alignment: .center) {
            
            Text("1.")
                .font(.title)
            
            Image("shawshank_poster")
                .resizable()
                .aspectRatio(contentMode: .fit)
            
            VStack(alignment: .leading) {
                Text("Shawshank redemption")
                    .font(.title3)
                    .multilineTextAlignment(.center)
                Text("1994")
                    .font(.headline)
                    .foregroundColor(Color.gray)
                    .multilineTextAlignment(.leading)
            }
            
            Spacer()
            
            Button(action: {
                favorite.toggle()
            }) {
                Image(systemName: favorite ? "heart.fill" : "heart")
                    .resizable()
                    .scaledToFit()
            }
            .frame(height: 30.0)
        }
        .frame(height: 90.0)
        //.border(/*@START_MENU_TOKEN@*/Color.black/*@END_MENU_TOKEN@*/, width: /*@START_MENU_TOKEN@*/1/*@END_MENU_TOKEN@*/)
    }
}

struct MovieListItem_Previews: PreviewProvider {
    static var previews: some View {
        MovieListItem(favorite: true)
    }
}
