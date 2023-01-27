//

import Foundation


class FileManagerVM {
    
    
    private static var cachesDir: URL {
        
        try! FileManager.default.url(for: .cachesDirectory, in: .userDomainMask, appropriateFor: nil, create: true)
    }
    
    private static var appDir: URL {
        
        try! FileManager.default.url(for: .applicationDirectory, in: .userDomainMask, appropriateFor: nil, create: true)
    }
    
    private static var topMoviesFile: URL {
        
        cachesDir.appendingPathComponent("top").appendingPathExtension(for: .json)
    }
    
    private static var movieCategoriesFile: URL {
        
        appDir.appendingPathComponent("movieCategories").appendingPathExtension(for: .json)
    }
    
    
    private static func movieDetailsFile(_ id: String) -> URL {
        
        return cachesDir.appendingPathComponent(id).appendingPathExtension(for: .json)
    }
    
    private static func fileExists(_ file: URL) -> Bool {
        
        return FileManager.default.fileExists(atPath: String(file.path))
    }
    
    private static func loadFile<T: Decodable>(_ file: URL) throws -> T? {
        
        if fileExists(file) {
            
            let data = try! Data(contentsOf: file)
            return try JSONDecoder().decode(T.self, from: data)
        }
        
        return nil
    }
    
    private static func saveFile(obj: Codable, file: URL) {
        
        let data = try! JSONEncoder().encode(obj)
        try! data.write(to: file)
    }
    
    
    static func loadTopMoviesFile() throws -> [MovieBasic]? {
        
        return try loadFile(topMoviesFile)
    }
    
    static func loadMovieDetailsFile(_ id: String) throws -> MovieDetailed? {
        
        return try loadFile(movieDetailsFile(id))
    }
    
    static func loadMovieCategoriesFile() throws -> [String : MovieCategories] {
        
        let data: [MovieCategories] = try loadFile(movieCategoriesFile) ?? []
        
        var dict: [String : MovieCategories] = [:]
        
        for item in data {
            dict[item.id] = item
        }
        
        return dict
    }
    
    static func saveTopMoviesFile(_ data: [MovieBasic]) {
        
        saveFile(obj: data, file: topMoviesFile)
    }
    
    static func saveMovieDetailsFile(_ id: String, _ data: MovieDetailed) {
        
        saveFile(obj: data, file: movieDetailsFile(id))
    }
    
    static func saveMovieCategoriesFile(_ data: [MovieBasic]) {
        
        var movieCatsArr: [MovieCategories] = []
        
        for movie in data {
            movieCatsArr.append(MovieCategories(id: movie.id, favorite: movie.favorite, watched: movie.watched))
        }
        
        saveFile(obj: movieCatsArr, file: movieCategoriesFile)
    }
    
}
