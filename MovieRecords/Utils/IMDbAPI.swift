//

import Foundation
import Alamofire


fileprivate struct APIResponseArray: Codable {
    var items: [MovieBasic]
    var errorMessage: String
}


class IMDbAPI {
    
    private static let baseUrl = "https://imdb-api.com/en/API/"
    private static let apiKey = "k_alt156cp"
    
    
    private static var topMoviesURLReq: String {
        "\(IMDbAPI.baseUrl)Top250Movies/\(IMDbAPI.apiKey)"
    }
    
    private static func movieDetailsURLReq(_ imdbId: String) -> String {
        return "\(IMDbAPI.baseUrl)Title/\(IMDbAPI.apiKey)/\(imdbId)/Trailer,"
    }
    
    
    static func topMovies(_ completitionHandler: @escaping ([MovieBasic]?) -> Void) {
        
        AF.request(IMDbAPI.topMoviesURLReq).responseDecodable(of: APIResponseArray.self) { response in
            
            completitionHandler(response.value?.items)
        }
    }
    
    static func movieDetails(_ imdbId: String, _ completitionHandler: @escaping (MovieDetailed?) -> Void) {
        
        AF.request(IMDbAPI.movieDetailsURLReq(imdbId)).responseDecodable(of: MovieDetailed.self) { response in
            
            completitionHandler(response.value)
        }
    }
    
}
