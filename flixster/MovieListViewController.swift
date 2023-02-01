//
//  MovieListViewController.swift
//  flixster
//
//  Created by Anderson David on 1/20/23.
//

import UIKit

class MovieListViewController: UIViewController,
    UITableViewDataSource {
    
    @IBOutlet weak var tableView: UITableView!
    var movies: [Movie] = []

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        //movies = MoviesResponse.loadJson()
        /*
        for movie in movies {
            print(movie.original_title)
        }
         */
        movies = Movie.mockMovies
        
        tableView.dataSource = self
    }


    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return movies.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "MovieCell", for: indexPath) as! MovieCell
        
        let movie = movies[indexPath.row]
        
        cell.configure(with: movie)
        
        return cell
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // TODO: Pt 1 - Pass the selected track to the detail view controller

        // Get the cell that triggered the segue
        if let cell = sender as? UITableViewCell,
           // Get the index path of the cell from the table view
           let indexPath = tableView.indexPath(for: cell),
           // Get the detail view controller
           let detailViewController = segue.destination as? DetailViewController {

            // Use the index path to get the associated track
            let movie = movies[indexPath.row]

            // Set the track on the detail view controller
            detailViewController.movie = movie
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
