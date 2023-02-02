//

import SwiftUI

struct RatingLabel: View {
    
    @AppStorage("mr-theme") private var colorTheme: ColorTheme = .clear
    
    @Binding var rating: Double
    
    private let fullStars: Int
    private let emptyStars: Int
    private let halfStar: Bool
    
    
    init(_ rating: Binding<Double>) {
        
        self._rating = rating
        
        let intRating = Int(round(rating.wrappedValue))
        
        self.fullStars = intRating / 2
        self.halfStar = intRating % 2 == 1
        self.emptyStars = (self.halfStar ? 4 : 5) - self.fullStars
    }
    
    
    var body: some View {
        
        HStack(alignment: .center) {
            
            HStack(alignment: .center, spacing: 2.0) {
                
                ForEach(0..<fullStars, id: \.self) { _ in
                    RatingStar(.fill)
                }
                
                if halfStar {
                    RatingStar(.half)
                }
                
                ForEach(0..<emptyStars, id: \.self) { _ in
                    RatingStar(.empty)
                }
            }
            
            Text("(\(String(format: "%.1f", rating)))")
                .font(.footnote)
        }
        .foregroundColor(colorTheme.text)
        .padding(.bottom, 0.5)
    }
}


struct RatingLabel_Previews: PreviewProvider {
    
    static var previews: some View {
        
        RatingLabel(.constant(7.3))
    }
}
