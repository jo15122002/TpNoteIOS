//
//  AlbumViewCell.swift
//  TpFinalSwift
//
//  Created by digital on 13/12/2022.
//

import Foundation
import UIKit

class AlbumViewCell:UICollectionViewCell{
    
    @IBOutlet weak var albumTitle: UILabel!
    @IBOutlet weak var thumbnail3: UIImageView!
    @IBOutlet weak var thumbnail2: UIImageView!
    @IBOutlet weak var thumbnail1: UIImageView!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
}
