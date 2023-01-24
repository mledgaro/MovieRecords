//

import Foundation
import Alamofire

struct APIResponseArray: Codable {
    
    var items: [Movie]
    var errorMessage: String
}



class IMDbAPI: ObservableObject {
    
    private static let baseUrl = "https://imdb-api.com/en/API/"
    private static let apiKey = "k_alt156cp"
    
    
    @Published var movies: [Movie]
    
    
    init() {
        
        self.movies = Array(repeating: Movie.SHAWSHANK_REDEMPTION, count: 10)
        
        self.top250()
    }
    
    func top250() {
        
        let url = "\(IMDbAPI.baseUrl)Top250Movies/\(IMDbAPI.apiKey)"
        
        AF.request(url).responseDecodable(of: APIResponseArray.self) { response in

            self.movies = response.value?.items ?? Array(repeating: Movie.SHAWSHANK_REDEMPTION, count: 10)
        }
    }
    
    static func movieDetails(imdbId: String) async throws {
        
        let url = "\(IMDbAPI.baseUrl)Title/\(IMDbAPI.apiKey)/\(imdbId)/FullActor,FullCast,Trailer,"
        
    }
    
}
