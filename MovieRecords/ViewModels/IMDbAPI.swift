//

import Foundation

class IMDbAPI {
    
    private static let baseUrl = "https://imdb-api.com/en/API/"
    private static let apiKey = "k_alt156cp"
    
    
    private static var cachesDir: URL {
        try! FileManager.default.url(for: .cachesDirectory, in: .userDomainMask, appropriateFor: nil, create: true)
    }
    
    static var topMoviesFile: URL {
        IMDbAPI.cachesDir.appendingPathComponent("top").appendingPathExtension(for: .json)
    }
    
    static var topMoviesRequest: String {
        "\(IMDbAPI.baseUrl)Top250Movies/\(IMDbAPI.apiKey)"
    }
    
    
    static func movieDetailsFile(imdbId: String) -> URL {
        return IMDbAPI.cachesDir.appendingPathComponent(imdbId).appendingPathExtension(for: .json)
    }
    
    static func movieDetailsRequest(imdbId: String) -> String {
        return "\(IMDbAPI.baseUrl)Title/\(IMDbAPI.apiKey)/\(imdbId)"
    }
    
    static func saveFile(obj: Codable, file: URL) {
        
        let data = try! JSONEncoder().encode(obj)
        try! data.write(to: file)
    }
    
}
