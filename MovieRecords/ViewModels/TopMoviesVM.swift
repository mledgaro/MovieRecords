//

import Foundation
import Alamofire

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
    
    
    private func loadData() {
        
        if let data = try! FileManagerVM.loadTopMoviesFile() {
            movies = data
        } else {
            requestData()
        }
    }
    
    private func requestData() {
        
        AF.request(IMDbAPI.topMoviesURLReq).responseDecodable(of: APIResponseArray.self) { response in
            
            //            debugPrint(response)
            
            self.movies = response.value?.items ?? []
            
            //            debugPrint(self.movies[...10])
            
            FileManagerVM.saveTopMoviesFile(self.movies)
        }
    }
    
}
