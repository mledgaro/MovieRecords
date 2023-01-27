//
//  Settings.swift
//  MovieRecords
//
//  Created by MAC on 27/01/23.
//

import SwiftUI

enum Theme {
    case clear, dark
}


struct Settings: View {
    
    @State private var selectedTheme: Theme = .dark
    
    var body: some View {
        
        Form {
            
            Section(header: Text("Appearence")) {
                Picker("Theme", selection: $selectedTheme) {
                    Text("Clear").tag(Theme.clear)
                    Text("Dark").tag(Theme.dark)
                }
            }
            
            Section(header: Text("Cache")) {
                Button(action: {
                    print("RELOAD CACHE")
                }) {
                    Label("Reload", systemImage: "arrow.triangle.2.circlepath")
                }
                Button(action: {
                    print("DELETE CACHE")
                }) {
                    Label("Delete", systemImage: "trash")
                        .foregroundColor(/*@START_MENU_TOKEN@*/.red/*@END_MENU_TOKEN@*/)
                }
            }
                          
        }
         // VStack
        
    } //  var body: some View
    
} // struct Settings: View

struct Settings_Previews: PreviewProvider {
    static var previews: some View {
        Settings()
    }
}
