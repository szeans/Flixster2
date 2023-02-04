//
//  MovieCell.swift
//  flixster
//
//  Created by SEAN CHOI on 1/31/23.
//

import UIKit
import Nuke

class MovieCell: UITableViewCell {

    @IBOutlet weak var movieTitle: UILabel!
    @IBOutlet weak var movieOverview: UILabel!
    @IBOutlet weak var movieImageView: UIImageView!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

    func configure(with movie: Movie) {
        movieTitle.text = movie.original_title
        movieOverview.text = movie.overview
        
        Nuke.loadImage(with: URL(string: Movie.posterBaseURLString + movie.poster_path)!, into: movieImageView)
    }

}
