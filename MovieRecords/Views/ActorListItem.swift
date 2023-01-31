//

import SwiftUI

struct ActorListItem: View {
    
    
    @AppStorage("mr-theme") private var colorTheme: ColorTheme = .dark
    
    var actor: Actor
    
    
    var body: some View {
        
        HStack(alignment: .center) {
            
            AsyncImage(url: URL(string: actor.image)) { image in
                image.resizable().scaledToFit()
            } placeholder: {
                ProgressView()
            }
            .border(colorTheme.highlight, width: /*@START_MENU_TOKEN@*/2/*@END_MENU_TOKEN@*/)
            .cornerRadius(/*@START_MENU_TOKEN@*/3.0/*@END_MENU_TOKEN@*/)
            
            VStack(alignment: .leading) {
                
                Text(actor.name)
                    .fontWeight(.bold)
                
                Text("as \(actor.asCharacter)")
                    .fontWeight(.regular)
                
            } // VStack
            .font(.headline)
            .fontWeight(.regular)
            .multilineTextAlignment(.leading)
            .foregroundColor(colorTheme.text)
            
        } // HStack - Image
        .frame(height: 90.0)
    }
}


struct ActorListItem_Previews: PreviewProvider {
    
    static var previews: some View {
        ActorListItem(actor: Actor.EMPTY)
    }
}
