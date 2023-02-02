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
    
    
    private func loadFile(_ imdbId: String) throws -> MovieDetailed {
        
        self.movies[imdbId] = MovieDetailed.EMPTY
        
        guard let data: MovieDetailed = try AppFile.movieDetails(fileName: imdbId).load() else {
            
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
                AppFile.movieDetails(fileName: imdbId).save(data)
            }
        }
    }
    
}
