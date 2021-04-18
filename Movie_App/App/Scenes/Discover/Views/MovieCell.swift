//
//  MovieCell.swift
//  MVVM Movie App
//
//  Created by Rafsan Ahmad on 18/04/2021.
//  Copyright © 2021 R.Ahmad. All rights reserved.
//

import UIKit

class MovieCell: UICollectionViewCell {
    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var subtitleLabel: UILabel!
    
    private struct Constants {
        static let maxHeight: CGFloat = 400
    }
    
    private static let sizingCell = UINib(nibName: String(describing: MovieCell.self), bundle: nil)
        .instantiate(withOwner: nil, options: nil).first! as! MovieCell

    static func height(forWidth width: CGFloat) -> CGFloat {
        sizingCell.prepareForReuse()
        sizingCell.layoutIfNeeded()
        
        var fittingSize = UIView.layoutFittingCompressedSize
        fittingSize.width = width
        let size = sizingCell.contentView.systemLayoutSizeFitting(fittingSize,
                                                                  withHorizontalFittingPriority: .required,
                                                                  verticalFittingPriority: .defaultLow)
        
        guard size.height < Constants.maxHeight else {
            return Constants.maxHeight
        }
        
        return size.height
    }
}
