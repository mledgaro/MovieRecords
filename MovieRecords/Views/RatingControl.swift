//

import SwiftUI


struct RatingControl: View {
    
    @State var rating = 0.0
    
    var body: some View {
        
        ZStack {
            
            RatingLabel($rating)
            
            Slider(value: $rating, in: 0...10)
                .accentColor(.white)
                .opacity(0.011)
                .frame(width: 100.0)
                .offset(x: -20)
        }
        
    } // var body: some View
    
} // struct RatingControl: View

struct RatingControl_Previews: PreviewProvider {
    
    static var previews: some View {
        
        RatingControl()
    }
}
