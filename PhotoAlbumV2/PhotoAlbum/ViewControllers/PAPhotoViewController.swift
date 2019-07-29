//
//  ViewController3.swift
//  AsincDataLoaderTest
//
//  Created by Emanuel Dumitrescu on 2/07/2019.
//  Copyright © 2019 Emanuel Dumitrescu. All rights reserved.
//

import UIKit

class PAPhotoViewController: UIViewController {
    
    @IBOutlet var backgroundView: UIView!
    @IBOutlet var photoView: UIView!
    @IBOutlet var photoDetail: UILabel!
    @IBOutlet var imageView: UIView!
    @IBOutlet var imageV: UIImageView!
    
    
    override func viewWillAppear(_ animated: Bool) {
        
        interfaceLoader()
        
    }
    
    override func viewDidAppear(_ animated: Bool) {
        
        let item = album[idLoad]
        
        let url = URL(string: item.urls[idPhotoLoad])
        
        DispatchQueue.global().async {
            let data = try? Data(contentsOf: url!)
            DispatchQueue.main.async {
                
                UIView.transition(with: self.imageV,
                                  duration: 0.75,
                                  options: .transitionCrossDissolve,
                                  animations: { self.imageV.image = UIImage(data: data!) },
                                  completion: nil)
                
            }
        }
        
    }
    
    func interfaceLoader() {
        
        let item = album[idLoad]
        
        photoDetail.text = "Title: \(item.titles[idPhotoLoad])"
        photoView.layer.cornerRadius = 20
        photoView.layer.masksToBounds = true
        imageView.layer.cornerRadius = 15
        imageView.layer.masksToBounds = true
        
    }

}
