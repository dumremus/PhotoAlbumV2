//
//  ViewControllerTableViewCell.swift
//  AsincDataLoaderTest
//
//  Created by Emanuel Dumitrescu on 28/07/2019.
//  Copyright © 2019 Emanuel Dumitrescu. All rights reserved.
//

import UIKit

class PATableViewControllerCell: UITableViewCell {
    
    @IBOutlet weak var albumImage: UIImageView!
    @IBOutlet weak var albumTitle: UILabel!
    
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        albumImage.layer.cornerRadius = 10
        albumImage.layer.masksToBounds = true
        
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        
        // Configure the view for the selected state
    }

}



