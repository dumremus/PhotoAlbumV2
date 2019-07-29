//
//  ViewController2.swift
//  AsincDataLoaderTest
//
//  Created by Emanuel Dumitrescu on 28/07/2019.
//  Copyright © 2019 Emanuel Dumitrescu. All rights reserved.
//

import UIKit
import AnimatableReload

class PAAlbumViewController: UIViewController, UICollectionViewDataSource, UICollectionViewDelegate {


    @IBOutlet var background: UIView!
    @IBOutlet var photosView: UIView!
    @IBOutlet var backButton: UIButton!
    @IBOutlet var collectionSupportView: UIView!
    @IBOutlet var colectionView: UICollectionView!
    @IBOutlet var albumDetail: UILabel!
    
    override func viewWillAppear(_ animated: Bool) {
        
        interfaceLoader()
    
    }
    
    override func viewDidAppear(_ animated: Bool) {
        
        
        AnimatableReload.reload(collectionView: self.colectionView, animationDirection: "down")
        
    }
    
    func interfaceLoader() {
        
        
        photosView.layer.cornerRadius = 20
        photosView.layer.masksToBounds = true
        collectionSupportView.layer.cornerRadius = 15
        collectionSupportView.layer.masksToBounds = true
        albumDetail.text = "Album: \(albums[idLoad].title)"
        
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        
        return album[idLoad].thumbnailUrls.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell1 = colectionView.dequeueReusableCell(withReuseIdentifier: "cell1", for: indexPath) as! PACollectionViewCustomCell
        
    let item = album[idLoad]
            
            let url = URL(string: item.thumbnailUrls[indexPath.row])
        
            cell1.ptotoTumbView1.sd_setImage(with: url, placeholderImage: UIImage(named: "placeholder.png"))
        
        
            return cell1
    
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        
        idPhotoLoad = indexPath.row
        performSegue(withIdentifier: "photoSegue", sender: self)
        
    }
    
    override func viewDidDisappear(_ animated: Bool) {
        self.view = nil
    }
    

}
