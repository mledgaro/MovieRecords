//

import SwiftUI


struct MovieCategoriesButtonsV: View {

    @AppStorage("mr-theme") private var colorTheme: ColorTheme = .dark
    
    @EnvironmentObject private var userDataVM: MoviesUserDataVM
    
    
    var imdbId: String
    
    var favorite: Bool {
        userDataVM.getUserData(imdbId).favorite
    }

    var watched: Bool {
        userDataVM.getUserData(imdbId).watched
    }
    
    
    init(_ imdbId: String) {
        
        self.imdbId = imdbId
    }
    
    
    var body: some View {

        HStack  {

            Spacer()

            Button(action: {}) {
                Image(systemName: favorite ? "heart.fill" : "heart")
                    .resizable()
                    .scaledToFit()
            }
            .frame(width: 25.0, height: 25.0)
            .onTapGesture {
                debugPrint("favorite \(imdbId)")
                userDataVM.userData[imdbId]?.favorite.toggle()
            }

            Spacer()

            Button(action: {}) {
                Image(systemName: watched ? "eye.fill" : "eye")
                    .resizable()
                    .scaledToFit()
            }
            .frame(width: 25.0, height: 25.0)
            .onTapGesture {
                debugPrint("watched \(imdbId)")
                userDataVM.userData[imdbId]?.watched.toggle()
            }

            Spacer()

        }
        .foregroundColor(colorTheme.highlight) // HStack

    } // var body: some View

} // struct MovieCategoriesButtonsV: View


struct MovieCategoriesButtonsV_Previews: PreviewProvider {
    
    static var previews: some View {
        MovieCategoriesButtonsV("tt0111161")
            .environmentObject(MoviesUserDataVM())
    }
}
