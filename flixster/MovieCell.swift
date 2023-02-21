//
//  MovieCell.swift
//  flixster
//
//  Created by Samuel Akinniranye on 2/20/23.
//

import UIKit

import Nuke



class MovieCell: UITableViewCell {



    

    @IBOutlet weak var movieImage: UIImageView!

    

    

    @IBOutlet weak var movieTitle: UILabel!

    

    

    @IBOutlet weak var movieOverview: UILabel!

    

    override func awakeFromNib() {

        super.awakeFromNib()

        // Initialization code

    }

    

    /// Configures the cell's UI for the given track.

    /// Configures the cell's UI for the given track.

    func configure(with movie: Movie) {

        movieTitle.text = movie.original_title

        movieOverview.text = movie.overview



        // Load image async via Nuke library image loading helper method

        Nuke.loadImage(with: URL(string: Movie.posterBaseURLString + movie.poster_path)!, into: movieImage)

    }



    override func setSelected(_ selected: Bool, animated: Bool) {

        super.setSelected(selected, animated: animated)



        // Configure the view for the selected state

    }



}
