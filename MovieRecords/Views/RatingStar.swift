//

import SwiftUI

enum StarType: String {
    case fill = "star.fill"
    case half = "star.leadinghalf.filled"
    case empty = "star"
}

struct RatingStar: View {
    
    private var type: StarType
    
    init(_ type: StarType) {
        self.type = type
    }
    
    var body: some View {
        Image(systemName: type.rawValue)
            .resizable()
            .scaledToFit()
            .frame(width: 16.0)
    }
}

struct RatingStar_Previews: PreviewProvider {
    static var previews: some View {
        RatingStar(.fill)
    }
}
