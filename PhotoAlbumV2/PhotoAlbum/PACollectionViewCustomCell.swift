//
//  AlbumCollectionViewCustomCell.swift
//  AsincDataLoaderTest
//
//  Created by Emanuel Dumitrescu on 28/07/2019.
//  Copyright © 2019 Emanuel Dumitrescu. All rights reserved.
//

import UIKit

class PACollectionViewCustomCell: UICollectionViewCell {
    
    
    @IBOutlet weak var ptotoTumbView1: UIImageView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        ptotoTumbView1.layer.cornerRadius = 5
        ptotoTumbView1.clipsToBounds = true
        
    }
    
}
