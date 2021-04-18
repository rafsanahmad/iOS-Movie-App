//
//  MovieDetailNavigator.swift
//  MVVM Movie App
//
//  Created by Rafsan Ahmad on 18/04/2021.
//  Copyright © 2021 R.Ahmad. All rights reserved.
//

import UIKit

protocol MovieDetailNavigatable {
    func goBack()
}

final class MovieDetailNavigator: MovieDetailNavigatable {
    private let navigationController: UINavigationController
    
    init(navigationController: UINavigationController) {
        self.navigationController = navigationController
    }
    func goBack() {
        navigationController.popViewController(animated: true)
    }
}
