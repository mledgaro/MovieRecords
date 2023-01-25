//

import Foundation
import Alamofire

class TopMoviesVM: ObservableObject {
    
    
    struct APIResponseArray: Codable {
        var items: [MovieBasic]
        var errorMessage: String
    }
    
    
    @Published var movies: [MovieBasic]
    
    
    private var file: URL
    
    
    init() {
        
        self.movies = []
        
        self.file = IMDbAPI.topMoviesFile
        
        debugPrint(self.file)
        
        if FileManager.default.fileExists(atPath: String(self.file.path)) {
            
            let data = try! Data(contentsOf: self.file)
            self.movies = try! JSONDecoder().decode([MovieBasic].self, from: data)
            
        } else {
            self.requestData()
        }
        
    }
    
    
    private func requestData() {
        
        AF.request(IMDbAPI.topMoviesRequest).responseDecodable(of: APIResponseArray.self) { response in
            
            //            debugPrint(response)
            
            self.movies = response.value?.items ?? []
            
            //            debugPrint(self.movies[...10])
            
            IMDbAPI.saveFile(obj: self.movies, file: self.file)
        }
    }
    
}
