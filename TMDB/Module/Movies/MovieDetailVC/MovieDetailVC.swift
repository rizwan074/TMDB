//
//  MovieDetailVC.swift
//  TMDB
//
//  Created by Rizwan Mehmood on 24/08/2023.
//

import UIKit
import Kingfisher

class MovieDetailVC: UIViewController {

    @IBOutlet var movieDetailView: MovieDetailView!
    
    var movieData: MoviesListModel?
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Call the function to populate the UI with movie data
        assignData()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        // Hide the navigation bar when the view is about to appear
        navigationController?.navigationBar.isHidden = true
    }

    // Populate UI elements with movie data
    func assignData() {
        // Round the corners of the background view using a custom extension
        movieDetailView.backView.roundCorners(corners: [.layerMinXMinYCorner, .layerMaxXMinYCorner], radius: 30)
        
        // Set the title label to the original title of the movie
        movieDetailView.titleLabel.text = movieData?.originalTitle
        
        // Load and display the movie poster image using its URL
        movieDetailView.imagView.kf.setImage(with: URL(string: Constants.IMAGE_URL + (movieData?.posterPath ?? "")))
        
        // Set the date label to the release date of the movie
        movieDetailView.dateLabel.text = movieData?.releaseDate
        
        // Set the director label to display the vote average of the movie
        movieDetailView.directorLabel.text = "Vote Average \(movieData?.voteAverage ?? 0)"
        
        // Set the overview label to the movie's overview text, or an empty string if unavailable
        movieDetailView.overviewLabel.text = movieData?.overview ?? ""
        
        // Set the screenPlay label to display the popularity of the movie
        movieDetailView.screenPlayLabel.text = "Popularity \(movieData?.popularity ?? 0)"
    }

    // Action triggered when the back button is tapped
    @IBAction func onTapBack(_ sender: Any) {
        // Navigate back to the previous view controller
        navigationController?.popViewController(animated: true)
    }

    // Static factory method to create an instance of the MovieDetailVC
    static func create() -> MovieDetailVC {
        let vc = MovieDetailVC()
        return vc
    }

}

