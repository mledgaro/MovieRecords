//

import Foundation


class TopMoviesVM: ObservableObject {
    
    
    @Published var movies: [MovieBasic]
    
    
    init() {
        
        self.movies = []
    
        self.loadData()
    }
    
    
    private func requestData() {
        
        IMDbAPI.topMovies { data in
            
            if let _ = data {
                self.movies = data!
                AppFile.topMovies().save(self.movies)
            }
        }
    }
    
    
    func loadData() {
        
        guard let data: [MovieBasic] = try! AppFile.topMovies().load() else {
            requestData()
            return
        }
        
        self.movies = data
    }
    
}
