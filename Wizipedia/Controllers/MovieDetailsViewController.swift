//
//  MovieDetails.swift
//  Wizipedia
//
//  Created by Tardes on 2/2/26.
//

import ExpandableLabel
import UIKit

class MovieDetailsViewController: UIViewController {
    @IBOutlet weak var movieTitle: UILabel!
    @IBOutlet weak var movieSummary: ExpandableLabel!
    // @IBOutlet weak var movieReleaseDate: UILabel!
    @IBOutlet weak var moviePoster: UIImageView!

    var movieID: String!
    private var movie: Movie!

    override func viewDidLoad() {
        super.viewDidLoad()

        movieSummary.contigureViewMoreViewLess()

        Task {
            movie = await Api.getMovie(withId: movieID)!

            DispatchQueue.main.async {
                self.moviePoster.loadFromInternet(url: self.movie.poster)
                self.movieTitle.text = self.movie.title
                self.movieTitle.sizeToFit()
                self.movieSummary.text = self.movie.summary
            }
        }
    }

    @IBAction func viewTrailer(_ sender: Any) {
        openUrl(movie.trailer)
    }

}
