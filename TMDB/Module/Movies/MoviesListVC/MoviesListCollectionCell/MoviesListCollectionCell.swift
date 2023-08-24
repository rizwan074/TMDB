//
//  MoviesListCollectionCell.swift
//  TMDB
//
//  Created by Rizwan Mehmood on 22/08/2023.
//

import UIKit

class MoviesListCollectionCell: UICollectionViewCell {
    
    
    static let ID = "MoviesListCollectionCell"

    @IBOutlet weak var thumnailImageView: UIImageView!
    
    @IBOutlet weak var titleLabel: UILabel!
    
    @IBOutlet weak var dateLabel: UILabel!
    @IBOutlet weak var backView: UIView!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        backView.layer.cornerRadius = 15
        backView.layer.masksToBounds = true
    }

}
