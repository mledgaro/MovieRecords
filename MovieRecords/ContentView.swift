//
//  ContentView.swift
//  MovieRecords
//
//  Created by MAC on 20/01/23.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        
        TabView {
            
            MoviesList()
                .tabItem {
                    Label("Top 250", systemImage: "square.3.layers.3d")
                }
            
            Text("Favorites")
                .tabItem {
                    Label("Favorites", systemImage: "heart.fill")
                }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
