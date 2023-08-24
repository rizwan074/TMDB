//
//  MoviesListVC.swift
//  TMDB
//
//  Created by Rizwan Mehmood on 22/08/2023.
//

import UIKit
import Kingfisher

class MoviesListVC: UIViewController {
    
    @IBOutlet var moviesListView: MoviesListView!
    
    var popularMoviesData = [MoviesListModel]()
    var isLoadingList: Bool = false
    var pageNumber: Int = 1
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Set up response object bindings for API calls
        responseObjectBinding()
        
        // Set up the collection view within the moviesListView
        moviesListView.setupCollectionView(delegate: self, dataSource: self)
    }
    
    override func viewWillAppear(_ animated: Bool) {
        // Hide the navigation bar when this view appears
        navigationController?.navigationBar.isHidden = true
    }
    
    // Factory method to create an instance of MoviesListVC
    static func create() -> MoviesListVC {
        let vc = MoviesListVC()
        return vc
    }
    
    // Function to handle scrolling events in the collection view
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        // Check if the user has reached near the end of the content and not currently loading
        if (((scrollView.contentOffset.y + scrollView.frame.size.height) > scrollView.contentSize.height) && !isLoadingList) {
            isLoadingList = true
            
            // Increment the page number and make an API call for more data
            pageNumber += 1
            moviesListView.getPopularMoviesCallApi(language: "en-US", page: pageNumber)
        }
    }
    
    // Function to set up response object bindings for API calls
    private func responseObjectBinding() {
        // Handle API error response
        moviesListView.errorObserver?.bind(listener: { [weak self] (error) in
            guard let self = self else { return }
            // Handle error (not shown in the provided code)
        })
        
        // Handle successful API response
        moviesListView.movieListResponseObserver?.bind(listener: { [weak self] (model) in
            guard let model = model else { return }
            
            // Update UI with new data and reset loading flag
            debugPrint("UpdateResponderLocation")
            self?.isLoadingList = false
            self?.popularMoviesData.append(contentsOf: model)
            self?.moviesListView.collectionView.reloadData()
        })
    }
}

// Implement UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout for MoviesListVC
extension MoviesListVC: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    
    // Return the number of items in the collection view
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return popularMoviesData.count
    }
    
    // Configure and return a cell for a specific index path
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: MoviesListCollectionCell.ID, for: indexPath) as? MoviesListCollectionCell else {
            return UICollectionViewCell()
        }
        
        // Configure cell with movie data
        cell.thumnailImageView.kf.setImage(with: URL(string: Constants.IMAGE_URL + (popularMoviesData[indexPath.row].posterPath ?? "")))
        cell.titleLabel.text = popularMoviesData[indexPath.row].originalTitle
        cell.dateLabel.text = popularMoviesData[indexPath.row].releaseDate
        return cell
    }
    
    // Handle selection of a cell
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        // Create an instance of MovieDetailVC and pass movie data
        let vc = MovieDetailVC.create()
        vc.movieData = popularMoviesData[indexPath.row]
        navigationController?.pushViewController(vc, animated: true)
    }
    
    // Define the size of each cell in the collection view
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let spacing: CGFloat = 8.0 // Adjust as needed
        let collectionViewWidth = collectionView.frame.width
        let cellWidth = (collectionViewWidth - 2 * spacing) / 3
        return CGSize(width: cellWidth, height: 160) // Square cells
    }
}
