//

import Foundation

struct MovieDetailed: Codable {
    
    static let SHAWSHANK_REDEMPTION = MovieDetailed(
        id: "tt0111161",
        title: "The Shawshank Redemption",
        year: "1994",
        imageUrl: "https://m.media-amazon.com/images/M/MV5BMDFkYTc0MGEtZmNhMC00ZDIzLWFmNTEtODM1ZmRlYWMwMWFmXkEyXkFqcGdeQXVyMTMxODk2OTU@._V1_UX128_CR0,12,128,176_AL_.jpg",
//        releaseDate: "1994-10-14",
        runtime: "2h 22min",
        plot: "Two imprisoned men bond over a number of years, finding solace and eventual redemption trough acts of common decency.",
        directors: "Frank Darabont",
        writers: "Stephen King, Frank Darabont",
        stars: "Tim Robbins, Morgan Freeman, Bon Gunton",
        genres: "Drama",
        countries: "USA",
        rating: "9.3",
        languages: "English")
    
    static let DUMMY = MovieDetailed(
        id: "",
        title: "<TITLE>",
        year: "<YEAR>",
        imageUrl: "",
        runtime: "<RUNTIME>",
        plot: "<PLOT>",
        directors: "<DIRECTORS>",
        writers: "<WRITERS>",
        stars: "<STARS>",
        genres: "<GENRES>",
        countries: "<COUNTRIES>",
        rating: "<RATING>",
        languages: "<LANGUAGES>")
    
    
    enum CodingKeys: String, CodingKey {
        
        case id
        case title
        case year
        case imageUrl = "image"
//        case releaseDate
//        case runtimeMins
        case runtime = "runtimeStr"
        case plot
        case directors
        case writers
        case stars
        case genres
        case countries
        case rating = "imDbRating"
        case languages
    }
    
    var id: String
    var title: String
    var year: String
    var imageUrl: URL?
//    var releaseDate: String
//    var runtimeMins: String
    var runtime: String
    var plot: String
    var directors: String
    var writers: String
    var stars: String
    var genres: String
    var countries: String
    var rating: String
    var languages: String
    
    
    init(from decoder: Decoder) throws {
        
        let container = try decoder.container(keyedBy: CodingKeys.self)
        
        self.id = try container.decode(String.self, forKey: .id)
        self.title = try container.decode(String.self, forKey: .title)
        self.year = try container.decode(String.self, forKey: .year)
        self.imageUrl = try URL(string: container.decode(String.self, forKey: .imageUrl))
//        self.releaseDate = try container.decode(String.self, forKey: .releaseDate)
        self.runtime = try container.decode(String.self, forKey: .runtime)
        self.plot = try container.decode(String.self, forKey: .plot)
        self.directors = try container.decode(String.self, forKey: .directors)
        self.writers = try container.decode(String.self, forKey: .writers)
        self.stars = try container.decode(String.self, forKey: .stars)
        self.genres = try container.decode(String.self, forKey: .genres)
        self.countries = try container.decode(String.self, forKey: .countries)
        self.rating = try container.decode(String.self, forKey: .rating)
        self.languages = try container.decode(String.self, forKey: .languages)
    }
    
    func encode(to encoder: Encoder) throws {
        
        var container = encoder.container(keyedBy: CodingKeys.self)
        
        try container.encode(self.id, forKey: .id)
        try container.encode(self.title, forKey: .title)
        try container.encode(self.year, forKey: .year)
        try container.encodeIfPresent(self.imageUrl, forKey: .imageUrl)
//        try container.encode(self.releaseDate, forKey: .releaseDate)
        try container.encode(self.runtime, forKey: .runtime)
        try container.encode(self.plot, forKey: .plot)
        try container.encode(self.directors, forKey: .directors)
        try container.encode(self.writers, forKey: .writers)
        try container.encode(self.stars, forKey: .stars)
        try container.encode(self.genres, forKey: .genres)
        try container.encode(self.countries, forKey: .countries)
        try container.encode(self.rating, forKey: .rating)
        try container.encode(self.languages, forKey: .languages)
    }
    
    init(id: String, title: String, year: String, imageUrl: String, /*releaseDate: String,*/ runtime: String, plot: String, directors: String, writers: String, stars: String, genres: String, countries: String, rating: String, languages: String) {
        
        self.id = id
        self.title = title
        self.year = year
        self.imageUrl = URL(string: imageUrl)
//        self.releaseDate = releaseDate
        self.runtime = runtime
        self.plot = plot
        self.directors = directors
        self.writers = writers
        self.stars = stars
        self.genres = genres
        self.countries = countries
        self.rating = rating
        self.languages = languages
    }
}
