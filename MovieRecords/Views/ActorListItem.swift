//

import SwiftUI

struct ActorListItem: View {
    
    var body: some View {
        
        HStack(alignment: .center) {
            
            AsyncImage(url: URL(string: "movie.imageUrl")) { image in
                image.resizable().scaledToFit()
            } placeholder: {
                ProgressView()
            }
            .border(Color("colorTheme.highlight"), width: /*@START_MENU_TOKEN@*/2/*@END_MENU_TOKEN@*/)
            .cornerRadius(/*@START_MENU_TOKEN@*/3.0/*@END_MENU_TOKEN@*/)
            
            VStack(alignment: .leading) {
                
                Text("movie.crew")
                    .font(.headline)
                    .fontWeight(.regular)
                    .multilineTextAlignment(.leading)
                
                Text("movie.year")
                    .font(.headline)
                    .fontWeight(.semibold)
                    .multilineTextAlignment(.leading)
                
            }
            
        } // HStack - Image
        .frame(height: 90.0)
    }
}

struct ActorListItem_Previews: PreviewProvider {
    static var previews: some View {
        ActorListItem()
    }
}
