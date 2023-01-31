//

import Foundation


class FileManagerVM {
    
    
    static var cachesDir: URL {
        
        try! FileManager.default.url(for: .cachesDirectory, in: .userDomainMask, appropriateFor: nil, create: true)
    }
    
    static var appDir: URL {
        
        try! FileManager.default.url(for: .applicationDirectory, in: .userDomainMask, appropriateFor: nil, create: true)
    }
    

    static func fileExists(_ file: URL) -> Bool {
        
        return FileManager.default.fileExists(atPath: String(file.path))
    }
    
    static func loadFile<T: Decodable>(_ file: URL) throws -> T? {
        
        debugPrint("LOAD FILE:\t\(file)")
        
        guard fileExists(file) else {
            return nil
        }
        
        let data = try! Data(contentsOf: file)
        return try JSONDecoder().decode(T.self, from: data)
    }
    
    static func saveFile(data: Codable, file: URL) {
        
        let encodedData = try! JSONEncoder().encode(data)
        try! encodedData.write(to: file)
    }
    
    static func deleteCacheFiles() {
        
        let cacheFiles = try! FileManager.default.contentsOfDirectory(at: cachesDir, includingPropertiesForKeys: nil, options:  .skipsHiddenFiles).filter{ $0.pathExtension == "json" }
        
        for fileUrl in cacheFiles {
            
            debugPrint(fileUrl)
            try! FileManager.default.removeItem(at: fileUrl)
        }
    }
    
}
