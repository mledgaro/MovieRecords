//

import Foundation


class MoviesUserDataVM: ObservableObject {
    
    
    @Published var userData: [String : MovieUserData]
    
    private var file: URL {
        FileManagerVM.appDir.appendingPathComponent("user_data").appendingPathExtension(for: .json)
    }
    
    
    init() {
        
        self.userData = [String : MovieUserData]()
        
        self.loadData()
    }
    
    
    func loadData() {
        
        guard let data: [MovieUserData] = try! FileManagerVM.loadFile(self.file) else {
            
            debugPrint("MoviesUserData file does not exist yet")
            return
        }
        
        data.forEach { item in
            self.userData[item.imdbId] = item
        }
    }
    
    func saveData() {
        FileManagerVM.saveFile(data: Array(self.userData.values), file: self.file)
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
