//

import Foundation


class MovieDetailsVM: ObservableObject {
    
    
    @Published var movies: [String : MovieDetailed]
    
    
    init() {
        
        self.movies = [:]
    }
    
    
    func getMovieData(_ imdbId: String) -> MovieDetailed {
        
        guard let data = movies[imdbId] else {
            
            return try! self.loadFile(imdbId)
        }
        
        return data
    }
    
    
    private func file(_ imdbId: String) -> URL {
        return FileManagerVM.cachesDir.appendingPathComponent(imdbId).appendingPathExtension(for: .json)
    }
    
    private func loadFile(_ imdbId: String) throws -> MovieDetailed {
        
        self.movies[imdbId] = MovieDetailed.EMPTY
        
        guard let data: MovieDetailed = try FileManagerVM.loadFile(self.file(imdbId)) else {
            
            self.requestData(imdbId)
            
            return MovieDetailed.EMPTY
        }
        
        self.movies[imdbId] = data
        
        return data
    }
    
    private func requestData(_ imdbId: String) {
        
        self.movies[imdbId] = MovieDetailed.EMPTY
        
        IMDbAPI.movieDetails(imdbId) { data in
            
            if let _ = data {
                
                self.movies[imdbId] = data
                self.saveFile(imdbId)
            }
        }
    }
    
    private func saveFile(_ imdbId: String) {
        
        guard let data = self.movies[imdbId] else {
            return
        }
        
        FileManagerVM.saveFile(data: data, file: self.file(imdbId))
    }
    
}
