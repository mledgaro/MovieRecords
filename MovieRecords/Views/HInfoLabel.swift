//

import SwiftUI

struct HInfoLabel: View {
    
    var label: String
    var content: String
    
    var body: some View {
        
        HStack(alignment: .top) {
            
            Text("\(label):")
                .fontWeight(.bold)
                .multilineTextAlignment(.trailing)
                .frame(width: 120.0, alignment: .trailing)
                
            Text(content)
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
