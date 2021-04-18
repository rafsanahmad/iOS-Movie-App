//
//  MovieDetailTipsView.swift
//  MVVM Movie App
//
//  Created by Rafsan Ahmad on 18/04/2021.
//  Copyright © 2021 R.Ahmad. All rights reserved.
//

import UIKit

final class MovieDetailTipsView: UIView {
    @IBOutlet weak var voteCountLabel: UILabel!
    @IBOutlet weak var statusLabel: UILabel!
    @IBOutlet var contentView: UIView!
    override init(frame: CGRect) {
        super.init(frame: frame)
        setup()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        setup()
    }
    
    func configure(withVoteCount voteCount: String,
                   status: String) {
        self.voteCountLabel.text = voteCount
        self.statusLabel.text = status
    }
    
    private func setup() {
        Bundle.main.loadNibNamed("MovieDetailTipsView", owner: self, options: nil)
        addSubview(contentView)
        
        contentView.frame = self.bounds
        contentView.autoresizingMask = [.flexibleHeight, .flexibleWidth]
        
    }
}

extension MovieDetailTipsView {
    func configure(with data: MovieDetailData) {
        configure(withVoteCount: data.voteCount,
                  status: data.status)
    }
}
