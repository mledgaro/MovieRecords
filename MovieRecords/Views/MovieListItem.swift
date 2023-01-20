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
        
        HStack {
            
            Spacer()
            
            Label {
                Text("Shawshank redemption")
                    .font(.title2)
                    .multilineTextAlignment(.center)
            } icon: {
                Image("shawshank_poster")
                    .resizable()
                    .scaledToFit()
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
            
            Spacer()
        }
        .frame(height: 85.0)
    }
}

struct MovieListItem_Previews: PreviewProvider {
    static var previews: some View {
        MovieListItem(favorite: true)
    }
}
