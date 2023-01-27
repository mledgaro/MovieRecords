//

import SwiftUI


struct MovieCategoriesButtonsV: View {


    @EnvironmentObject var topMoviesVM: TopMoviesVM
    
    var index: Int
    
    private var favorite: Bool {
        topMoviesVM.movies[index].favorite
    }
    
    private var watched: Bool {
        topMoviesVM.movies[index].watched
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
                topMoviesVM.movies[index].favorite.toggle()
            }

            Spacer()

            Button(action: {}) {
                Image(systemName: watched ? "eye.fill" : "eye")
                    .resizable()
                    .scaledToFit()
            }
            .frame(width: 25.0, height: 25.0)
            .onTapGesture {
                topMoviesVM.movies[index].watched.toggle()
            }

            Spacer()

        } // HStack

    } // var body: some View

} // struct MovieCategoriesButtonsV: View


struct MovieCategoriesButtonsV_Previews: PreviewProvider {
    static var previews: some View {
        MovieCategoriesButtonsV(index: 0)
            .environmentObject(TopMoviesVM())
    }
}
