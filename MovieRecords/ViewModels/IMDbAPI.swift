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
    
    private var cachesDir: URL {
        try! FileManager.default.url(for: .cachesDirectory, in: .userDomainMask, appropriateFor: nil, create: true)
    }
    
    private var topFile: URL {
        cachesDir.appendingPathComponent("top").appendingPathExtension(for: .json)
    }
    
    @Published var movies: [Movie]
    
    
    init() {
        
        self.movies = []
        
        if FileManager.default.fileExists(atPath: String(topFile.path)) {
            
            let topData = try! Data(contentsOf: topFile)
            self.movies = try! JSONDecoder().decode([Movie].self, from: topData)
            
        } else {
            self.top250()
        }
        
    }
    
    func top250() {
        
        let url = "\(IMDbAPI.baseUrl)Top250Movies/\(IMDbAPI.apiKey)"
        
        AF.request(url).responseDecodable(of: APIResponseArray.self) { response in

            self.movies = response.value?.items ?? []
            let data = try! JSONEncoder().encode(self.movies)
            try! data.write(to: self.topFile)
        }
    }
    
//    static func movieDetails(imdbId: String) async throws {
//
//        let [url = "\(IMDbAPI.baseUrl)Title/\(IMDbAPI.apiKey)/\(imdbId)/FullActor,FullCast,Trailer,"
//
//    }
    
}
