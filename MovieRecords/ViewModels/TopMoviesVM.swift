//

import Foundation
import Alamofire


fileprivate struct APIResponseArray: Codable {
    var items: [MovieBasic]
    var errorMessage: String
}


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
        
        AF.request(IMDbAPI.topMoviesURLReq).responseDecodable(of: APIResponseArray.self) { response in
            
            if let dataResp = response.value {
                
                self.movies = dataResp.items
                
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
