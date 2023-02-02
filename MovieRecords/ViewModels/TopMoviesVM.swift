//

import Foundation


class TopMoviesVM: ObservableObject {
    
    
    @Published var movies: [MovieBasic]
    
    private var file: URL {
        FileManagerVM.cachesDir.appendingPathComponent("top_movies").appendingPathExtension(for: .json)
    }
    
    
    init() {
        
        self.movies = []
    
        self.loadData()
    }
    
    
    private func loadFile() throws -> [MovieBasic]? {
        return try FileManagerVM.loadFile(file)
    }
    
    private func requestData() {
        
        IMDbAPI.topMovies { data in
            
            if let _ = data {
                self.movies = data!
                self.saveData()
            }
        }
    }
    
    private func saveData() {
        
        FileManagerVM.saveFile(data: self.movies, file: file)
    }
    
    
    func loadData() {
        
        guard let data = try! loadFile() else {
            requestData()
            return
        }
        
        self.movies = data
    }
    
}
