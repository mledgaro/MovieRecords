//

import Foundation

struct MovieBasic: Codable {
    
    static let SHAWSHANK_REDEMPTION = MovieBasic(
        id: "tt0111161",
        rank: 1,
        title: "Shawshank redemption",
        year: "1994",
        imageUrl: "https://m.media-amazon.com/images/M/MV5BMDFkYTc0MGEtZmNhMC00ZDIzLWFmNTEtODM1ZmRlYWMwMWFmXkEyXkFqcGdeQXVyMTMxODk2OTU@._V1_UX128_CR0,12,128,176_AL_.jpg",
        crew: "Frank Darabont (dir.), Tim Robbins, Morgan Freeman",
        rating: 9.2)
    
    
    enum CodingKeys: String, CodingKey {
        
        case id
        case rank
        case title
        case year
        case imageUrl = "image"
        case crew
        case rating = "imDbRating"
    }
    
    /*
     api response
     {
        items: [
            {id:, rank:, title:, fullTitle:, year:, image:, crew:, imDbRating:, imDbRatingCount:}, ...
        ],
        errorMessage: ""
     */
    
    var id: String
    var rank: Int
    var title: String
    var year: String
    var imageUrl: URL?
    var crew: String
    var rating: Float
    
//    var favorite: Bool
//    var watched: Bool
    
    
    init(from decoder: Decoder) throws {

        let container = try decoder.container(keyedBy: CodingKeys.self)

        self.id = try container.decode(String.self, forKey: .id)
        self.rank = try Int(container.decode(String.self, forKey: .rank)) ?? 0
        self.title = try container.decode(String.self, forKey: .title)
        self.year = try container.decode(String.self, forKey: .year)
        self.imageUrl = try URL(string: container.decode(String.self, forKey: .imageUrl))
        self.crew = try container.decode(String.self, forKey: .crew)
        self.rating = try Float(container.decode(String.self, forKey: .rating)) ?? 0.0
    }
    
    func encode(to encoder: Encoder) throws {
        
        var container = encoder.container(keyedBy: CodingKeys.self)
        
        try container.encode(self.id, forKey: .id)
        try container.encode(String(self.rank), forKey: .rank)
        try container.encode(self.title, forKey: .title)
        try container.encode(self.year, forKey: .year)
        try container.encodeIfPresent(self.imageUrl, forKey: .imageUrl)
        try container.encode(self.crew, forKey: .crew)
        try container.encode(String(self.rating), forKey: .rating)
    }
    
    init(id: String, rank: Int, title: String, year: String, imageUrl: String, crew: String, rating: Float) {
        
        self.id = id
        self.rank = rank
        self.title = title
        self.year = year
        self.imageUrl = URL(string: imageUrl)
        self.crew = crew
        self.rating = rating
    }
    
    
}
