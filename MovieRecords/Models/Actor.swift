//

import Foundation

struct Actor: Codable {
    
    static let EMPTY = Actor(id: "", name: "<NAME>", image: "", asCharacter: "<CHARACTER>")
    
    var id: String
    var name: String
    var image: String
    var asCharacter: String
}
