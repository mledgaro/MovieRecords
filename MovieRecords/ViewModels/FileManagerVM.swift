//

import Foundation


class FileManagerVM {
    
    
    private static var cachesDir: URL {
        
        try! FileManager.default.url(for: .cachesDirectory, in: .userDomainMask, appropriateFor: nil, create: true)
    }
    
    private static var topMoviesFile: URL {
        
        cachesDir.appendingPathComponent("top").appendingPathExtension(for: .json)
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
        
        return try loadFile(FileManagerVM.topMoviesFile)
    }
    
    static func loadMovieDetailsFile(_ id: String) throws -> MovieDetailed? {
        
        return try loadFile(FileManagerVM.movieDetailsFile(id))
    }
    
    static func saveTopMoviesFile(_ data: [MovieBasic]) {
        
        saveFile(obj: data, file: topMoviesFile)
    }
    
    static func saveMovieDetailsFile(_ id: String, _ data: MovieDetailed) {
        
        saveFile(obj: data, file: movieDetailsFile(id))
    }
    
}
