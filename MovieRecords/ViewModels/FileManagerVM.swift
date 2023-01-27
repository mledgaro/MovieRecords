//

import Foundation


class FileManagerVM {
    
    
    private static var cachesDir: URL {
        
        try! FileManager.default.url(for: .cachesDirectory, in: .userDomainMask, appropriateFor: nil, create: true)
    }
    
    private static var appDir: URL {
        
        try! FileManager.default.url(for: .applicationDirectory, in: .userDomainMask, appropriateFor: nil, create: true)
    }
    
    
    private static func fileExists(_ file: URL) -> Bool {
        
        return FileManager.default.fileExists(atPath: String(file.path))
    }
    
    private static func loadFile<T: Decodable>(_ file: URL) throws -> T? {
        
        guard fileExists(file) else {
            return nil
        }
        
        let data = try! Data(contentsOf: file)
        return try JSONDecoder().decode(T.self, from: data)
    }
    
    private static func saveFile(data: Codable, file: URL) {
        
        let encodedData = try! JSONEncoder().encode(data)
        try! encodedData.write(to: file)
    }
    
    
    class TopMoviesFM {
        
        static var file: URL {
            cachesDir.appendingPathComponent("topMovies").appendingPathExtension(for: .json)
        }
        
        static func loadData() throws -> [MovieBasic]? {
            
            return try loadFile(file)
        }
        
        static func saveData(_ data: [MovieBasic]) {
            
            saveFile(data: data, file: file)
        }
    }
    
    class MovieDetailsFM {
        
        static func file(_ id: String) -> URL {
            
            return cachesDir.appendingPathComponent(id).appendingPathExtension(for: .json)
        }
        
        static func loadData(_ id: String) throws -> MovieDetailed? {
            
            return try loadFile(file(id))
        }
        
        static func saveData(_ id: String, _ data: MovieDetailed) {
            
            saveFile(data: data, file: file(id))
        }
    }
    
    class MoviesUserDataFM {
        
        static var file: URL {
            
            appDir.appendingPathComponent("moviesUserData").appendingPathExtension(for: .json)
        }
        
        static func loadData() throws -> [String : MovieUserData]? {
            
            guard let arr: [MovieUserData] = try loadFile(file) else {
                return nil
            }
            
            var dict = [String : MovieUserData]()
            
            for item in arr {
                dict[item.id] = item
            }
            
            return dict
        }
        
        static func saveData(_ data: [MovieBasic]) {
            
            var arr = [MovieUserData]()
            
            for movie in data {
                arr.append(MovieUserData(id: movie.id, favorite: movie.favorite, watched: movie.watched))
            }
            
            saveFile(data: arr, file: file)
        }
    }

}
