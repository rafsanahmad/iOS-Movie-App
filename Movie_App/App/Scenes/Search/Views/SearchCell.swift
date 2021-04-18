//
//  SearchCell.swift
//  MVVM Movie App
//
//  Created by Rafsan Ahmad on 18/04/2021.
//  Copyright © 2021 R.Ahmad. All rights reserved.
//

import UIKit
import Nuke

class SearchCell: UITableViewCell {
    @IBOutlet weak var titleImageView: UIImageView!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var subtitleLabel: UILabel!
    
    override func awakeFromNib() {
        selectionStyle = .none
    }
    
    func configure(withImageUrl url: String?,
                   title: String,
                   subtitle: String) {
        if let url = url {
            Nuke.loadImage(with: URL(string: url)!, into: titleImageView)
        }
        titleLabel.text = title
        subtitleLabel.text = subtitle
    }
}

extension SearchCell {
    func configure(withSearchResultItemViewModel item: SearchResultItemViewModel) {
        configure(withImageUrl: item.imageUrl,
                  title: item.title,
                  subtitle: item.subtitle)
    }
}
