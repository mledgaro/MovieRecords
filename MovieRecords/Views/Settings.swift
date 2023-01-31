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
    
    @AppStorage("mr-theme") private var colorTheme: AppTheme = .dark
    
    @State private var deleteCacheAlert = false
    
    @EnvironmentObject var topMoviesVM: TopMoviesVM
    
    var body: some View {
        
        Form {
            
            Section(header: Text("Appearence")
                .font(.headline)
                .foregroundColor(colorTheme.highlight)) {
                    
                Picker("Theme", selection: $colorTheme) {
                    Text("Clear").tag(AppTheme.clear)
                    Text("Dark").tag(AppTheme.dark)
                }
            }
            
            Section(header: Text("Cache")
                .font(.headline)
                .foregroundColor(colorTheme.highlight)) {
                
                    
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
                        FileManagerVM.deleteCacheFiles()
                        topMoviesVM.loadData()
                    }
                    
                }
            }
            
            Section(header: Text("Developer").font(.headline)
                .foregroundColor(colorTheme.highlight)) {
                    
                    Text("Edgar Mendoza")
                }
            
            Section(header: Text("Contact").font(.headline)
                .foregroundColor(colorTheme.highlight)) {
                    
                    Text("mledgaro@gmail.com")
                }
            
        } // Form
        .scrollContentBackground(.hidden)
        .background(colorTheme.background)
        
    } //  var body: some View
    
} // struct Settings: View

struct Settings_Previews: PreviewProvider {
    static var previews: some View {
        Settings().environmentObject(TopMoviesVM())
    }
}
