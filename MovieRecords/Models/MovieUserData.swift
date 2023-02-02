//

import Foundation

struct MovieUserData: Codable {
    
    var imdbId: String
    var favorite: Bool
    var watched: Bool
    var rating: Double
    
    init(imdbId: String, favorite: Bool, watched: Bool, rating: Double) {
        
        self.imdbId = imdbId
        self.favorite = favorite
        self.watched = watched
        self.rating = rating
    }
    
    init(imdbId: String) {
        
        self.imdbId = imdbId
        self.favorite = false
        self.watched = false
        self.rating = 0.0
    }
    
}
