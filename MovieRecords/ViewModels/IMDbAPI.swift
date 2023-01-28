//

import Foundation

class IMDbAPI {
    
    private static let baseUrl = "https://imdb-api.com/en/API/"
    private static let apiKey = "k_alt156cp"
    
    
    static var topMoviesURLReq: String {
        "\(IMDbAPI.baseUrl)Top250Movies/\(IMDbAPI.apiKey)"
    }
    
    static func movieDetailsURLReq(_ imdbId: String) -> String {
        return "\(IMDbAPI.baseUrl)Title/\(IMDbAPI.apiKey)/\(imdbId)/Trailer,"
    }
    
}
