//

import Foundation
import Alamofire

class MovieDetailedVM: ObservableObject {
    
    
    var id: String
    
    @Published var movie: MovieDetailed
    
    
    init(_ id: String) {
        
        self.movie = MovieDetailed.SHAWSHANK_REDEMPTION
        self.id = id
        
        loadData()
    }
    
    
    private func loadData() {
        
        if let data = try! FileManagerVM.loadMovieDetailsFile(self.id) {
            movie = data
        } else {
            requestData()
        }
    }
    
    private func requestData() {
        
        AF.request(IMDbAPI.movieDetailsURLReq(self.id)).responseDecodable(of: MovieDetailed.self) { response in
            
            self.movie = response.value ?? MovieDetailed.SHAWSHANK_REDEMPTION
            
            FileManagerVM.saveMovieDetailsFile(self.id, self.movie)
        }
    }
    
}
