//

import Foundation
import Alamofire


struct APIResponseArray: Codable {
    
    var items: [MovieBasic]
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
    
    @Published var movies: [MovieBasic]
    
    
    init() {
        
        self.movies = []
        
        if FileManager.default.fileExists(atPath: String(topFile.path)) {
            
            let topData = try! Data(contentsOf: topFile)
            self.movies = try! JSONDecoder().decode([MovieBasic].self, from: topData)
            
        } else {
            self.top250()
        }
        
    }
    
    func top250() {
        
        let url = "\(IMDbAPI.baseUrl)Top250Movies/\(IMDbAPI.apiKey)"
        
        print("api request made: \(url)")
        
        AF.request(url).responseDecodable(of: APIResponseArray.self) { response in

//            debugPrint(response)
            
            self.movies = response.value?.items ?? []
            
//            debugPrint(self.movies[...10])
            
            // save response as cached file
            let data = try! JSONEncoder().encode(self.movies)
            try! data.write(to: self.topFile)
        }
    }
    
    func movieDetails(imdbId: String) {

        let url = "\(IMDbAPI.baseUrl)Title/\(IMDbAPI.apiKey)/\(imdbId)"

        print("api request made: \(url)")
        
        AF.request(url).responseDecodable(of: APIResponseArray.self) { response in

//            debugPrint(response)
            
//            self.movies[index].details = response.value?.items ?? []
            
//            debugPrint(self.movies[...10])
            
            // save response as cached file
            let data = try! JSONEncoder().encode(self.movies)
            try! data.write(to: self.topFile)
        }
    }
    
}
