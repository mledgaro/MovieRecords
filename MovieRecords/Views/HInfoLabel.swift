//

import SwiftUI

struct HInfoLabel: View {
    
    @AppStorage("mr-theme") private var colorTheme: AppTheme = .dark
    
    var label: String
    var content: String
    
    var body: some View {
        
        HStack(alignment: .top) {
            
            Text("\(label):")
                .fontWeight(.bold)
                .multilineTextAlignment(.trailing)
                .frame(width: 120.0, alignment: .trailing)
                .foregroundColor(colorTheme.highlight)
                
            Text(content)
                .foregroundColor(colorTheme.text)
                .multilineTextAlignment(.leading)
                .frame(width: 220.0, alignment: .leading)
        }
        .padding(.bottom, 0.5)
    }
}

struct HLabel_Previews: PreviewProvider {
    static var previews: some View {
        HInfoLabel(label: "Director", content: "Frank Darabont")
    }
}
