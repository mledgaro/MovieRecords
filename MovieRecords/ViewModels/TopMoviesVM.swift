//

import Foundation
import Alamofire


enum MoviesFilter {
    case all, favorites, watched
}


class TopMoviesVM: ObservableObject {
    
    
    private struct APIResponseArray: Codable {
        var items: [MovieBasic]
        var errorMessage: String
    }
    
    
    @Published var movies: [MovieBasic]
    
    
    init() {
        
        self.movies = []
        
        loadData()
    }
    
    
    func loadData() {
        
        guard let data = try! FileManagerVM.TopMoviesFM.loadData() else {
            requestData()
            return
        }
        
        movies = data
        loadMoviesUserData()
    }
    
    private func loadMoviesUserData() {
        
        guard let moviesUserData = try! FileManagerVM.MoviesUserDataFM.loadData() else {
            return
        }
        
        for i in 0..<movies.count {
            
            guard let mud = moviesUserData[movies[i].id] else {
                continue
            }
            
            movies[i].favorite = mud.favorite
            movies[i].watched = mud.watched
        }
    }
    
    private func requestData() {
        
        AF.request(IMDbAPI.topMoviesURLReq).responseDecodable(of: APIResponseArray.self) { response in
            
            if let dataResp = response.value {
                
                self.movies = dataResp.items
                self.loadMoviesUserData()
                FileManagerVM.TopMoviesFM.saveData(dataResp.items)
            }
        }
    }
    
}
