//

import Foundation


class MovieCategoriesVM {

    
//    struct DictItem: Codable {
//
//        var id: String
//        var favorite: Bool
//        var watched: Bool
//    }
//
//
//    private var dict: [String : MovieCategories]
//
//
//    private static var dictFile: URL {
//        try! FileManager.default.url(for: .applicationDirectory, in: .userDomainMask, appropriateFor: nil, create: true).appendingPathComponent("moviesCategories").appendingPathExtension(for: .json)
//    }
//
//
//
//
//    init() {
//
//        self.dict = MovieCategoriesVM.loadDictionary()
//    }
//
//    func saveDictionary() {
//
//
//    }
//
//
//    private static func loadDictionary() -> [String : MovieCategories] {
//
//        let file = MovieCategoriesVM.dictFile
//        var dict: [String : MovieCategories] = [:]
//
//        if FileManager.default.fileExists(atPath: String(file.path)) {
//
//            let data = try! Data(contentsOf: file)
//            let dictItems = try! JSONDecoder().decode([DictItem].self, from: data)
//
//            for dictItem in dictItems {
//
//                dict[dictItem.id] = MovieCategories(watched: dictItem.watched, favorite: dictItem.favorite)
//            }
//        }
//
//        return dict
//    }
    
}

