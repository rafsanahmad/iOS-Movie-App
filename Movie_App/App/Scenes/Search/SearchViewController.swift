//
//  SearchViewController.swift
//  MVVM Movie App
//
//  Created by Rafsan Ahmad on 18/04/2021.
//  Copyright © 2021 R.Ahmad. All rights reserved.
//

import UIKit
import RxSwift
import RxCocoa

final class SearchViewController: UIViewController {
    var viewModel: SearchViewModel!
    
    @IBOutlet weak var searchTextField: UITextField!
    @IBOutlet weak var segmentedControl: UISegmentedControl!
    @IBOutlet weak var tableView: UITableView! {
        didSet {
            tableView.register(UINib(nibName: String(describing: SearchCell.self), bundle: nil),
                               forCellReuseIdentifier: String(describing: SearchCell.self))
        }
    }
    
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
        let input = SearchViewModel.Input(searchText: searchTextField.rx.text.orEmpty.asDriver(),
                                          selectedCategoryIndex: segmentedControl.rx.value.asDriver(),
                                          selected: tableView.rx.itemSelected.asDriver())
        
        let output = viewModel.transform(input: input)
        
        output.switchHidden
            .drive(segmentedControl.rx.isHidden)
            .disposed(by: disposeBag)
        
        output.loading
            .drive(UIApplication.shared.rx.isNetworkActivityIndicatorVisible)
            .disposed(by: disposeBag)
        
        
        output.results
            .drive(tableView.rx.items(cellIdentifier: String(describing: SearchCell.self), cellType: SearchCell.self)) { (row, element, cell) in
                cell.configure(withSearchResultItemViewModel: element)
            }
            .disposed(by: disposeBag)
        
        output.selectedDone
            .drive()
            .disposed(by: disposeBag)
    }
}
