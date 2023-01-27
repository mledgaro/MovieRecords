//

import Foundation
import Alamofire

class TopMoviesVM: ObservableObject {
    
    
    private struct APIResponseArray: Codable {
        var items: [MovieBasic]
        var errorMessage: String
    }
    
    
    @Published var movies: [MovieBasic]
    
    private var movieCategories: [String : MovieCategories]
    
    
    init() {
        
        self.movies = []
        self.movieCategories = [:]
        
        loadData()
    }
    
    
    private func loadData() {
        
        if let data = try! FileManagerVM.loadTopMoviesFile() {
            movies = data
            loadMovieCategories()
        } else {
            requestData()
        }
    }
    
    private func loadMovieCategories() {
        
        movieCategories = try! FileManagerVM.loadMovieCategoriesFile()
        
        for i in 0..<movies.count {
            if let movieCat = movieCategories[movies[i].id] {
                movies[i].favorite = movieCat.favorite
                movies[i].watched = movieCat.watched
            }
        }
    }
    
    private func requestData() {
        
        AF.request(IMDbAPI.topMoviesURLReq).responseDecodable(of: APIResponseArray.self) { response in
            
            //            debugPrint(response)
            
            self.movies = response.value?.items ?? []
            
            self.loadMovieCategories()
            
            //            debugPrint(self.movies[...10])
            
            FileManagerVM.saveTopMoviesFile(self.movies)
        }
    }
    
}
