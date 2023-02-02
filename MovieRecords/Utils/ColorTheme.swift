//

import Foundation
import SwiftUI

enum ColorTheme: String {
    
    case clear = "clear"
    case dark = "dark"
    
    var background: Color {
        Color("\(self.rawValue)-background")
    }
    
    var text: Color {
        Color("\(self.rawValue)-text")
    }
    
    var highlight: Color {
        Color("\(self.rawValue)-highlight")
    }
}
