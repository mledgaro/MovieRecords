//

import SwiftUI


struct MovieCategoriesButtonsV: View {


    @Binding var favorite: Bool
    @Binding var watched: Bool
    
    
    var body: some View {

        HStack  {

            Spacer()

            Button(action: {}) {
                Image(systemName: watched ? "eye.fill" : "eye")
                    .resizable()
                    .scaledToFit()
            }
            .frame(width: 25.0, height: 25.0)
            .onTapGesture {
                watched.toggle()
            }

            Spacer()

            Button(action: {}) {
                Image(systemName: favorite ? "heart.fill" : "heart")
                    .resizable()
                    .scaledToFit()
            }
            .frame(width: 25.0, height: 25.0)
            .onTapGesture {
                favorite.toggle()
            }

            Spacer()

        } // HStack

    } // var body: some View

} // struct MovieCategoriesButtonsV: View


struct MovieCategoriesButtonsV_Previews: PreviewProvider {
    static var previews: some View {
        MovieCategoriesButtonsV(favorite: .constant(false), watched: .constant(false))
    }
}
