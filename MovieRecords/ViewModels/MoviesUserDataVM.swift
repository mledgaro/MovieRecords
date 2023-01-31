//

import Foundation

class MoviesUserDataVM: ObservableObject {
    
    
    @Published var userData: [String : MovieUserData]
    
    private var file: URL {
        FileManagerVM.appDir.appendingPathComponent("user_data").appendingPathExtension(for: .json)
    }
    
    
    init() {
        
        self.userData = [:]
        
        try! self.loadData()
    }
    
    
    func loadData() throws {
        
        self.userData = [:]
        
        guard let data: [MovieUserData] = try! FileManagerVM.loadFile(file) else { return }
        
        data.forEach { item in
            self.userData[item.imdbId] = item
        }
    }
    
    func saveData() {
        FileManagerVM.saveFile(data: Array(self.userData.values), file: file)
    }
    
    func getUserData(_ imdbId: String) -> MovieUserData {

        if let _ = self.userData[imdbId] {
            self.userData[imdbId] = MovieUserData(imdbId: imdbId)
        }

        return self.userData[imdbId]!
    }
    
    func isShowing(imdbId: String, filter: MoviesFilter) -> Bool {
        return filter.isShowing(self.getUserData(imdbId))
    }
    
}
