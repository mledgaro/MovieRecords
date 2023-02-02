//

import SwiftUI


struct RatingControl: View {
    
    @EnvironmentObject private var userDataVM: MoviesUserDataVM
    
    var imdbId: String
    
    @State private var rating: Double
    
    
    init(_ imdbId: String) {
        
        self.imdbId = imdbId
        self.rating = 0.0
    }
    
    var body: some View {
        
        ZStack {
            
            RatingLabel($rating)
            
            Slider(value: $rating, in: 0...10)
                .accentColor(.white)
                .opacity(0.011)
                .frame(width: 100.0)
                .offset(x: -20)
        }
        .onAppear() {
            self.rating = userDataVM.userData[imdbId]?.rating ?? 0.0
        }
        .onChange(of: rating) { _ in
            userDataVM.userData[imdbId]?.rating = self.rating
        }
        
    } // var body: some View
    
} // struct RatingControl: View

struct RatingControl_Previews: PreviewProvider {
    
    static var previews: some View {
        
        RatingControl("tt0111161")
            .environmentObject(MoviesUserDataVM())
    }
}
