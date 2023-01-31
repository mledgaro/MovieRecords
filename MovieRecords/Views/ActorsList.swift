//

import SwiftUI

struct ActorsList: View {
    
    
    @AppStorage("mr-theme") private var colorTheme: ColorTheme = .dark
    
    var actorList: [Actor]
    
    
    var body: some View {
        
        VStack {
            
            List(actorList, id: \.id) { actor_ in
            
                ActorListItem(actor: actor_)
                    .listRowBackground(colorTheme.background)
            }
            .scrollContentBackground(.hidden)
            .background(colorTheme.background)
        }
            
    } // var body: some View
    
} // struct ActorsList: View


struct ActorsList_Previews: PreviewProvider {
    static var previews: some View {
        ActorsList(actorList: Array(repeating: Actor.EMPTY, count: 5))
    }
}
