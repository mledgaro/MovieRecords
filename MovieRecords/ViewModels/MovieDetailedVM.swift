//

import Foundation
import Alamofire

class MovieDetailedVM: ObservableObject {
    
    
    @Published var movie: MovieDetailed
    
    
    init() {
        
        self.movie = MovieDetailed.SHAWSHANK_REDEMPTION
    }
    
    
    private func requestData(imdbId: String) {
        
        let file = IMDbAPI.movieDetailsFile(imdbId: imdbId)
        
        AF.request(IMDbAPI.movieDetailsRequest(imdbId: imdbId)).responseDecodable(of: MovieDetailed.self) { response in
            
//            debugPrint(response)
            
            self.movie = response.value ?? MovieDetailed.SHAWSHANK_REDEMPTION
            
//            debugPrint(self.movies[...10])
            
            IMDbAPI.saveFile(obj: self.movie, file: file)
        }
    }
    
    
    func loadData(imdbId: String) {
        
        let file = IMDbAPI.movieDetailsFile(imdbId: imdbId)
        
        if FileManager.default.fileExists(atPath: String(file.path)) {
            
            let data = try! Data(contentsOf: file)
            self.movie = try! JSONDecoder().decode(MovieDetailed.self, from: data)
            
        } else {
            requestData(imdbId: imdbId)
        }
    }
    
}
