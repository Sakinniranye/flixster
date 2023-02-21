//
//  DetailViewController.swift
//  flixster
//
//  Created by Samuel Akinniranye on 2/20/23.
//

import UIKit

import Nuke



class DetailViewController: UIViewController {
        @IBOutlet weak var image: UIImageView!
    
    @IBOutlet weak var movieTitle: UILabel!
    
    @IBOutlet weak var voteAverage: UILabel!
    
    @IBOutlet weak var votesNum: UILabel!
    
    @IBOutlet weak var popularity: UILabel!
    
    @IBOutlet weak var overview: UITextView!
    
    var movie: Movie!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        Nuke.loadImage(with: URL(string:Movie.posterBaseURLString + movie.poster_path)!, into: image)
        voteAverage.text = "Vote Averge: " + String(movie.vote_average)
        votesNum.text = "Votes: " + String(movie.vote_count)
        overview.text = movie.overview
        popularity.text = "Rating: 95"
        movieTitle.text = movie.original_title
        // Do any additional setup after loading the view.
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


