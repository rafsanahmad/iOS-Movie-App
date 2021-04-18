//
//  DiscoverViewController.swift
//  MVVM Movie App
//
//  Created by Rafsan Ahmad on 18/04/2021.
//  Copyright © 2021 R.Ahmad. All rights reserved.
//

import UIKit
import RxSwift
import RxCocoa

final class DiscoverViewController: UIViewController {
    var viewModel: DiscoverViewModel!
    
    @IBOutlet weak var carouselsView: DiscoverMainView!
    
    private let disposeBag = DisposeBag()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        bindViewModel()
    }

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.navigationController?.setNavigationBarHidden(true, animated: animated)
    }
    
    override var preferredStatusBarStyle: UIStatusBarStyle {
        return .lightContent
    }
    
    private func bindViewModel() {
        let input = DiscoverViewModel.Input(ready: rx.viewWillAppear.asDriver(),
                                            selected: carouselsView.selectedIndex.asDriver(onErrorJustReturn: (0, 0)))
        
        let output = viewModel.transform(input: input)
        
        output.loading
            .drive(UIApplication.shared.rx.isNetworkActivityIndicatorVisible)
            .disposed(by: disposeBag)
        
        output.results
            .drive(onNext: { [weak self] caroselViewModel in
                guard let strongSelf = self else { return }
                strongSelf.carouselsView.setDataSource(caroselViewModel)
                strongSelf.carouselsView.reloadData()
            })
            .disposed(by: disposeBag)
        
        output.selected
            .drive()
            .disposed(by: disposeBag)
    }
}
