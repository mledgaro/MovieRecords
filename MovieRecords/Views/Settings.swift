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
    
    @AppStorage("mr-theme") private var theme: String = "dark"
    
    @State private var deleteCacheAlert = false
    
    @EnvironmentObject var topMoviesVM: TopMoviesVM
    
    var body: some View {
        
        Form {
            
            Section(header: Text("Appearence")
                .font(.headline)
                .foregroundColor(Color("\(theme)-highlight"))) {
                    
                Picker("Theme", selection: $theme) {
                    Text("Light").tag("light")
                    Text("Dark").tag("dark")
                }
            }
            
            Section(header: Text("Cache")
                .font(.headline)
                .foregroundColor(Color("\(theme)-highlight"))) {
                
                    
                Button(action: {
                    print("DELETE CACHE")
                    deleteCacheAlert = true
                }) {
                    Label("Delete", systemImage: "trash")
                }
                .alert("Are you sure you want to delete all cache files?", isPresented: $deleteCacheAlert) {
                    
                    Button("Cancel", role: .cancel) { print("cancel") }
                    
                    Button("Delete", role: .destructive) {
                        print("delete")
                        FileManagerVM.deleteCache()
                        topMoviesVM.loadData()
                    }
                    
                }
            }
            
        } // Form
        .scrollContentBackground(.hidden)
        .background(Color("\(theme)-background"))
        
        
    } //  var body: some View
    
} // struct Settings: View

struct Settings_Previews: PreviewProvider {
    static var previews: some View {
        Settings().environmentObject(TopMoviesVM())
    }
}
