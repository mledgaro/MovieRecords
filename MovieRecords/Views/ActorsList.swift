//

import SwiftUI

struct ActorsList: View {
    
    @AppStorage("mr-theme") private var colorTheme: AppTheme = .dark
    
    var body: some View {
        
        Text("Hello world")
        
    }
}

struct ActorsList_Previews: PreviewProvider {
    static var previews: some View {
        ActorsList()
    }
}
