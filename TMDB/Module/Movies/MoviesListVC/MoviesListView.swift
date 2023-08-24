//
//  MoviesListView.swift
//  TMDB
//
//  Created by Rizwan Mehmood on 22/08/2023.
//

import UIKit
import Moya

class MoviesListView: UIView {
    
    @IBOutlet weak var collectionView: UICollectionView!
    
    var movieListResponseObserver: ObservableListner<[MoviesListModel]?>? = ObservableListner(nil)
    var errorObserver: ObservableListner<String?>? = ObservableListner(nil)
    
    var provider = MoyaProvider<APIServices>()
    
    // MARK: - CollectionView Setup
    
    /// Sets up the collection view with the provided delegate and data source.
    /// - Parameters:
    ///   - delegate: The delegate object conforming to UICollectionViewDelegate.
    ///   - dataSource: The data source object conforming to UICollectionViewDataSource.
    func setupCollectionView(delegate: UICollectionViewDelegate, dataSource: UICollectionViewDataSource) {
        let nib = UINib(nibName: MoviesListCollectionCell.ID, bundle: nil)
        collectionView.register(nib, forCellWithReuseIdentifier: MoviesListCollectionCell.ID)
        
        collectionView.delegate = delegate
        collectionView.dataSource = dataSource
        
        // Set the collection view layout
        if let layout = collectionView.collectionViewLayout as? UICollectionViewFlowLayout {
            layout.minimumInteritemSpacing = 8.0 // Adjust spacing between cells
            layout.minimumLineSpacing = 8.0 // Adjust spacing between rows
        }
        
        // Call API to fetch popular movies
        getPopularMoviesCallApi(language: "en-US", page: 1)
    }
    
    // MARK: - API Calls
    
    /// Calls the API to fetch popular movies.
    /// - Parameters:
    ///   - language: The language code for the API request.
    ///   - page: The page number for the API request.
    func getPopularMoviesCallApi(language: String, page: Int) {
        if Reachability.isConnectedToNetwork() {
            // Start loader animation if needed
//            startLoader()
            
            provider.request(.getPopularMoviesList(language: language, page: page)) { [weak self] (result) in
                switch result {
                case .success(let response):
                    // Stop loader animation if needed
//                    self?.stopLoader()
                    
                    do {
                        let statusCode = response.statusCode
                        let json = try response.mapJSON()
                        print(json)
                        print(statusCode)
                        
                        if statusCode == 200 {
                            let decoder = JSONDecoder()
                            let movieResponse = try decoder.decode(MoviesListModelElement.self, from: response.data)
                            debugPrint(movieResponse)
                            
                            // Update the movie list response observer
                            self?.movieListResponseObserver?.value = movieResponse.results
                        }
                    } catch {
                        print(error.localizedDescription)
                        
                        // Update the error observer with the error description
                        self?.errorObserver?.value = error.localizedDescription
                    }
                case .failure(let error):
                    print(error.localizedDescription)
                    
                    // Update the error observer with the error description
                    self?.errorObserver?.value = error.localizedDescription
                }
            }
        } else {
            // Update the error observer with no internet connectivity message
            errorObserver?.value = Constants.Connectivity.NO_INTERNET
        }
    }
}
