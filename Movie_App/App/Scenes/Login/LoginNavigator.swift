//
//  LoginNavigator.swift
//  MVVM Movie App
//
//  Created by Rafsan Ahmad on 18/04/2021.
//  Copyright © 2021 R.Ahmad. All rights reserved.
//

import UIKit

protocol LoginNavigatable {
    func toMain()
}

final class LoginNavigator {
    private let navigationController: UINavigationController
    
    init(navigationController: UINavigationController) {
        self.navigationController = navigationController
    }
    
    func toMain() {
        navigationController.dismiss(animated: true, completion: nil)
    }
}
