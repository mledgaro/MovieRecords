//

import Foundation
import Alamofire

class MovieDetailedVM: ObservableObject {
    
    
    var id: String
    
    @Published var movie: MovieDetailed
    
    
    init(_ id: String) {
        
        self.id = id
        self.movie = MovieDetailed.DUMMY
        
        loadData()
    }
    
    
    private func loadData() {
        
        if let data = try! FileManagerVM.MovieDetailsFM.loadData(id) {
            movie = data
        } else {
            requestData()
        }
    }
    
    private func requestData() {
        
        AF.request(IMDbAPI.movieDetailsURLReq(self.id)).responseDecodable(of: MovieDetailed.self) { response in
            
            if let dataResp = response.value {
                self.movie = dataResp
                FileManagerVM.MovieDetailsFM.saveData(self.id, dataResp)
            }
        }
    }
    
}
