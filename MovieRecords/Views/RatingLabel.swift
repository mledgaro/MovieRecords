//

import SwiftUI

struct RatingLabel: View {
    
    @AppStorage("mr-theme") private var colorTheme: AppTheme = .dark
    
    var body: some View {
        Text(/*@START_MENU_TOKEN@*/"Hello, World!"/*@END_MENU_TOKEN@*/)
    }
}

struct RatingLabel_Previews: PreviewProvider {
    static var previews: some View {
        RatingLabel()
    }
}
