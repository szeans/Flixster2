//
//  DetailViewController.swift
//  flixster
//
//  Created by SEAN CHOI on 1/31/23.
//

import UIKit
import Nuke
class DetailViewController: UIViewController {

    var movie: Movie?
    
    @IBOutlet weak var overview: UILabel!
    @IBOutlet weak var pop: UILabel!
    @IBOutlet weak var votes: UILabel!
    @IBOutlet weak var voteAvg: UILabel!
    @IBOutlet weak var titleMovie: UILabel!
    @IBOutlet weak var imgBg: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        if let movie = movie {
            Nuke.loadImage(with: movie.poster_url, into: imgBg)
            titleMovie.text = movie.original_title
            votes.text = String(format: "%d Votes", movie.vote_count)
            voteAvg.text = String(format: "%.2f Vote Average", movie.vote_average)
            pop.text = String(format: "%.2f Popularity", movie.popularity)
            overview.text = movie.overview
        }
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
