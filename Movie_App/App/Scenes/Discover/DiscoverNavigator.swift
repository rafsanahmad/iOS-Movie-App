//
//  DiscoverNavigator.swift
//  MVVM Movie App
//
//  Created by Rafsan Ahmad on 18/04/2021.
//  Copyright © 2021 R.Ahmad. All rights reserved.
//

import UIKit

protocol DiscoverNavigatable {
    func navigateToMovieDetailScreen(withMovieId id: Int, api: TMDBApiProvider)
    func navigateToPersonDetailScreen()
    func navigateToShowDetailScreen()
}

final class DiscoverNavigator: DiscoverNavigatable {
    private let navigationController: UINavigationController
    
    init(navigationController: UINavigationController) {
        self.navigationController = navigationController
    }

    func navigateToMovieDetailScreen(withMovieId id: Int, api: TMDBApiProvider) {
        let movieDetailNavigator = MovieDetailNavigator(navigationController: navigationController)
        let movieDetailViewModel = MovieDetailViewModel(dependencies: MovieDetailViewModel.Dependencies(id: id,
                                                                                                        api: api,
                                                                                                        navigator: movieDetailNavigator))
        let movieDetailViewController = UIStoryboard.main.movieDetailViewController
        movieDetailViewController.viewModel = movieDetailViewModel
        
        navigationController.show(movieDetailViewController, sender: nil)
    }
    
    func navigateToPersonDetailScreen() {
        
    }
    
    func navigateToShowDetailScreen() {
        
    }
}
