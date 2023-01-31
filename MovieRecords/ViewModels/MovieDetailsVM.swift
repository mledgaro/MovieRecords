//

import Foundation
import Alamofire


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
        
        AF.request(IMDbAPI.movieDetailsURLReq(imdbId)).responseDecodable(of: MovieDetailed.self) { response in
            
            if let dataResp = response.value {
                
                self.movies[imdbId] = dataResp
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
