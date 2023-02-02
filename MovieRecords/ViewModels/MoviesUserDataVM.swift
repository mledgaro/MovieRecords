//

import Foundation


class MoviesUserDataVM: ObservableObject {
    
    
    @Published var userData: [String : MovieUserData]
    
    
    init() {
        
        self.userData = [String : MovieUserData]()
        
        self.loadData()
    }
    
    
    func loadData() {
        
        guard let data: [MovieUserData] = try! AppFile.userData().load() else {
            
            debugPrint("MoviesUserData file does not exist yet")
            return
        }
        
        data.forEach { item in
            self.userData[item.imdbId] = item
        }
    }
    
    func saveData() {
        
        AppFile.userData().save(Array(self.userData.values))
    }
    
    func getUserData(_ imdbId: String) -> MovieUserData {

        guard let ud = self.userData[imdbId] else {
            
            self.userData[imdbId] = MovieUserData(imdbId: imdbId)
            return self.userData[imdbId]!
        }

        return ud
    }
    
    func isShowing(imdbId: String, filter: MoviesFilter) -> Bool {
        return filter.isShowing(self.getUserData(imdbId))
    }
    
}
