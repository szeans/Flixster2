//
//  Movies.swift
//  flixster
//
//  Created by Anderson David on 1/20/23.
//

import Foundation

struct MoviesResponse: Decodable {
    var results: [Movie]
    
    static func loadJson() -> [Movie] {
        if let url = Bundle.main.url(forResource: "data", withExtension: "json") {
            do {
                let data = try Data(contentsOf: url)
                let decoder = JSONDecoder()
                let jsonData = try decoder.decode(MoviesResponse.self, from: data)
                return jsonData.results
            } catch {
                print("error:\(error)")
            }
        }
        return []
    }
}

struct Movie: Decodable {
    var original_title: String
    var overview: String
    
    var backdrop_path: String
    var poster_path: String // when loading image with Nuke, make sure you convert to url by prepending base url
    static var posterBaseURLString: String = "https://image.tmdb.org/t/p/w185"
    
    var popularity: Double
    
    var vote_average: Double
    var vote_count: Int
}
/*
 extension Movie {
 static var mockMovies: [Movie] = [
 Movie(original_title: "Puss in Boots: The Last Wish",
 overview: "Puss in Boots discovers that his passion for adventure has taken its toll: He has burned through eight of his nine lives, leaving him with only one life left. Puss sets out on an epic journey to find the mythical Last Wish and restore his nine lives.",
 img_url: URL(string:"https://image.tmdb.org/t/p/w185/kuf6dutpsT0vSVehic3EZIqkOBt.jpg")!,
 poster_url: URL(string:"https://image.tmdb.org/t/p/w185/r9PkFnRUIthgBp2JZZzD380MWZy.jpg")!,
 popularity: 9062.029,
 vote_average: 8.6,
 vote_count: 2077),
 Movie(original_title: "Glass Onion: A Knives Out Mystery",
 overview: "World-famous detective Benoit Blanc heads to Greece to peel back the layers of a mystery surrounding a tech billionaire and his eclectic crew of friends.",
 img_url: URL(string:"https://image.tmdb.org/t/p/w185/vDGr1YdrlfbU9wxTOdpf3zChmv9.jpg")!,
 poster_url: URL(string:"https://image.tmdb.org/t/p/w185/dKqa850uvbNSCaQCV4Im1XlzEtQ.jpg")!,
 popularity: 1294.59,
 vote_average: 7.1,
 vote_count: 2776),
 Movie(original_title: "Avatar: The Way of Water",
 overview: "Set more than a decade after the events of the first film, learn the story of the Sully family (Jake, Neytiri, and their kids), the trouble that follows them, the lengths they go to keep each other safe, the battles they fight to stay alive, and the tragedies they endure.",
 img_url: URL(string:"https://image.tmdb.org/t/p/w185/t6HIqrRAclMCA60NsSmeqe9RmNV.jpg")!,
 poster_url: URL(string:"https://image.tmdb.org/t/p/w185/s16H6tpK2utvwDtzZ8Qy4qm5Emw.jpg")!,
 popularity: 2619.368,
 vote_average: 7.7,
 vote_count: 4361),
 Movie(original_title: "The Woman King",
 overview: "The story of the Agojie, the all-female unit of warriors who protected the African Kingdom of Dahomey in the 1800s with skills and a fierceness unlike anything the world has ever seen, and General Nanisca as she trains the next generation of recruits and readies them for battle against an enemy determined to destroy their way of life.",
 img_url: URL(string:"https://image.tmdb.org/t/p/w185/438QXt1E3WJWb3PqNniK0tAE5c1.jpg")!,
 poster_url: URL(string:"https://image.tmdb.org/t/p/w185/gkseI3CUfQtMKX41XD4AxDzhQb7.jpg")!,
 popularity: 1131.805,
 vote_average: 7.9,
 vote_count: 1071),
 Movie(original_title: "High Heat",
 overview: "When the local mafia shows up to burn down her restaurant, Ana, a chef with a meticulous past, defends her turf and proves her knife skills both in and out of the kitchen.",
 img_url: URL(string:"https://image.tmdb.org/t/p/w185/mmD0NVdhiRiCu64YKem5GK5PSfy.jpg")!,
 poster_url: URL(string:"https://image.tmdb.org/t/p/w185/mYQSbZdGX0JJb49NLO04UA0iFEU.jpg")!,
 popularity: 976.129,
 vote_average: 5.1,
 vote_count: 23),
 Movie(original_title: "Terrifier 2",
 overview: "After being resurrected by a sinister entity, Art the Clown returns to Miles County where he must hunt down and destroy a teenage girl and her younger brother on Halloween night.  As the body count rises, the siblings fight to stay alive while uncovering the true nature of Art's evil intent.",
 img_url: URL(string:"https://image.tmdb.org/t/p/w185/8gLhu8UFPZfH2Hv11JhTZkb9CVl.jpg")!,
 poster_url: URL(string:"https://image.tmdb.org/t/p/w185/cRdA9xjHBbobw4LJFsQ3j1CgpVq.jpg")!,
 popularity: 801.092,
 vote_average: 7,
 vote_count: 908)
 ]
 }
 */
