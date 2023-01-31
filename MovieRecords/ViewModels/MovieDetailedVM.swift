//

import Foundation
import Alamofire

class MovieDetailedVM: ObservableObject {
    
    
    var imdbId: String
    
    @Published var movie: MovieDetailed
    
    private var file: URL {
        FileManagerVM.cachesDir.appendingPathComponent(imdbId).appendingPathExtension(for: .json)
    }
    
    
    init(_ imdbId: String) {
        
        self.imdbId = imdbId
        self.movie = MovieDetailed.EMPTY
        
        loadData()
    }
    
    
    func loadData() {
        
        if let data = try! loadFile() {
            movie = data
        } else {
            requestData()
        }
    }
    
    private func requestData() {
        
        AF.request(IMDbAPI.movieDetailsURLReq(self.imdbId)).responseDecodable(of: MovieDetailed.self) { response in
            
            if let dataResp = response.value {
                self.movie = dataResp
                self.saveData()
            }
        }
    }
    
    private func loadFile() throws -> MovieDetailed? {
        
        return try FileManagerVM.loadFile(file)
    }
    
    private func saveData() {
        
        FileManagerVM.saveFile(data: self.movie, file: file)
    }
    
}
