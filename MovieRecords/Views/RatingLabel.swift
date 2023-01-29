//

import SwiftUI

struct RatingLabel: View {
    
    @AppStorage("mr-theme") private var colorTheme: AppTheme = .clear
    
    private var rating: String
    private let fullStars: Int
    private let emptyStars: Int
    private let halfStar: Bool
    
    init(rating: String) {
        
        let intRating = Int(round(Float(rating) ?? 0.0))
        
        self.rating = rating
        self.fullStars = intRating / 2
        self.halfStar = intRating % 2 == 1
        self.emptyStars = 5 - self.fullStars - (self.halfStar ? 1 : 0)
    }
    
    var body: some View {
        
        HStack(alignment: .center) {
            
            Text("Rating:")
                .fontWeight(.bold)
                .multilineTextAlignment(.trailing)
                .frame(width: 120.0, alignment: .trailing)
                .foregroundColor(colorTheme.highlight)
                
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
            
            Text("(\(rating))")
                .font(.footnote)
        }
        .foregroundColor(colorTheme.text)
        .padding(.bottom, 0.5)
    }
}

struct RatingLabel_Previews: PreviewProvider {
    static var previews: some View {
        RatingLabel(rating: "9.3")
    }
}
