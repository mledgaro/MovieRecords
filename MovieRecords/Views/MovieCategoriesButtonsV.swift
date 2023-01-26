//

import SwiftUI


struct MovieCategoriesButtonsV: View {


    @State private var watched = false
    @State private var favorite = false


    var body: some View {

        HStack  {

            Spacer()

            Button(action: {
//                watched.toggle()
            }) {
                Image(systemName: watched ? "eye.fill" : "eye")
                    .resizable()
                    .scaledToFit()
            }
            .frame(width: 25.0, height: 25.0)
            .onTapGesture {
                self.watched.toggle()
            }

            Spacer()

            Button(action: {
//                favorite.toggle()
            }) {
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
        MovieCategoriesButtonsV()
    }
}
