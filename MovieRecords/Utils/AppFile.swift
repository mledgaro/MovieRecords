//

import Foundation


enum AppFile {
    
    case topMovies(fileName: String = "top_movies")
    case userData(fileName: String = "user_data")
    case movieDetails(fileName: String)
    
    
    private static var cachesDir: URL {
        
        try! FileManager.default.url(for: .cachesDirectory, in: .userDomainMask, appropriateFor: nil, create: true)
    }
    
    private static var appDir: URL {
        
        try! FileManager.default.url(for: .applicationDirectory, in: .userDomainMask, appropriateFor: nil, create: true)
    }
    
    
    private var file: URL {
        
        switch self {
            
            case let .topMovies(fileName), let .movieDetails(fileName):
                return AppFile.cachesDir.appendingPathComponent(fileName).appendingPathExtension(for: .json)
            
            case let .userData(fileName):
                return AppFile.appDir.appendingPathComponent(fileName).appendingPathExtension(for: .json)
        }
    }
    
    
    static func deleteCacheFiles() {
        
        let cacheFiles = try! FileManager.default.contentsOfDirectory(at: AppFile.cachesDir, includingPropertiesForKeys: nil, options:  .skipsHiddenFiles).filter{ $0.pathExtension == "json" }
        
        for fileUrl in cacheFiles {
            
            debugPrint(fileUrl)
            try! FileManager.default.removeItem(at: fileUrl)
        }
    }
    
    
    private func exists() -> Bool {
        
        return FileManager.default.fileExists(atPath: String(file.path))
    }
    
    
    func load<T: Decodable>() throws -> T? {
        
        let f = file
        
        debugPrint("LOAD: \(f)")
        
        guard exists() else {
            debugPrint("FILE DOES NOT EXIST: \(f)")
            return nil
        }
        
        let data = try! Data(contentsOf: f)
        
        return try JSONDecoder().decode(T.self, from: data)
    }
    
    func save(_ data: Codable) {
        
        let encodedData = try! JSONEncoder().encode(data)
        try! encodedData.write(to: file)
    }
    
}
