//

import SwiftUI


struct Settings: View {
    
    @AppStorage("mr-theme") private var colorTheme: ColorTheme = .dark
    
    @EnvironmentObject var topMoviesVM: TopMoviesVM
    
    @State private var deleteCacheAlert = false
    
    
    var body: some View {
        
        Form {
            
            Group {
                
                Section(header: Text("Appearence")
                    .font(.headline)
                    .foregroundColor(colorTheme.text)) {
                        
                        Picker("Theme", selection: $colorTheme) {
                            Text("Clear").tag(ColorTheme.clear)
                            Text("Dark").tag(ColorTheme.dark)
                        }
                        
                    }
                
                Section(header: Text("Cache")
                    .font(.headline)
                    .foregroundColor(colorTheme.text)) {
                        
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
                                AppFile.deleteCacheFiles()
                                topMoviesVM.loadData()
                            }
                        }
                    }
                
                Section(header: Text("Developer").font(.headline)
                    .foregroundColor(colorTheme.text)) {
                        
                        Text("Edgar Mendoza")
                    }
                
                Section(header: Text("Contact").font(.headline)
                    .foregroundColor(colorTheme.text)) {
                        
                        Text(verbatim: "mledgaro@gmail.com")
                    }
                
            } // Group
            .listRowBackground(colorTheme.highlight)
            
        } // Form
        .scrollContentBackground(.hidden)
        .background(colorTheme.background)
        .foregroundColor(colorTheme.background)
        
    } //  var body: some View
    
} // struct Settings: View

struct Settings_Previews: PreviewProvider {
    
    static var previews: some View {
        Settings()
            .environmentObject(TopMoviesVM())
    }
}
