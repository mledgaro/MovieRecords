//

import Foundation

enum MoviesFilter {
    
    case all, favorites, watched, pending
    
    
    func isShowing(_ userData: MovieUserData) -> Bool {
        
        switch self {
            
        case .all:
            return true
        case .favorites:
            return userData.favorite
        case .watched:
            return userData.watched
        case .pending:
            return !userData.watched
        }
    }
    
}
