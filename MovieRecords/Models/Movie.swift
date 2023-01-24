//

import Foundation

struct Movie: Codable {
    
    static let SHAWSHANK_REDEMPTION = Movie(
        id: "tt0111161",
        rank: "1",
        title: "Shawshank redemption",
        fullTitle: "Shawshank redemption (1994)",
        year: "1994",
        image: "shawshank_poster",
        crew: "Frank Darabont (dir.), Tim Robbins, Morgan Freeman",
        imDbRating: "9.2",
        imDbRatingCount: "2689519")
    
    var id: String
    var rank: String
    var title: String
    var fullTitle: String
    var year: String
    var image: String
    var crew: String
    var imDbRating: String
    var imDbRatingCount: String
}
