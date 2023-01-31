//

import Foundation

struct MovieUserData: Codable {
    
    var imdbId: String
    var favorite: Bool
    var watched: Bool
    
    init(imdbId: String, favorite: Bool, watched: Bool) {
        
        self.imdbId = imdbId
        self.favorite = favorite
        self.watched = watched
    }
    
    init(imdbId: String) {
        
        self.imdbId = imdbId
        self.favorite = false
        self.watched = false
    }
    
}
