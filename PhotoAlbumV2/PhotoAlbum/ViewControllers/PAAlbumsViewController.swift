//
//  ViewController.swift
//  AsincDataLoaderTest
//
//  Created by Emanuel Dumitrescu on 28/07/2019.
//  Copyright © 2019 Emanuel Dumitrescu. All rights reserved.
//

import UIKit
import AnimatableReload
import SDWebImage

class PAAlbumsViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    @IBOutlet var blurView: UIView!
    @IBOutlet var backgroundView: UIView!
    @IBOutlet var albumsView: UIView!
    @IBOutlet var albumDisplayView: UIView!
    @IBOutlet var albumTableView: UITableView!
    
    override func viewWillAppear(_ animated: Bool) {
        
        interfaceLoader()
        
    }
    
    override func viewDidAppear(_ animated: Bool) {


        AnimatableReload.reload(tableView: self.albumTableView, animationDirection: "up")
        
    }
    
    func interfaceLoader() {
        
        blurView.bounds = self.view.bounds
        albumsView.layer.cornerRadius = 20
        albumsView.layer.masksToBounds = true
        albumDisplayView.layer.cornerRadius = 15
        albumDisplayView.layer.masksToBounds = true

    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return albums.count
    }
    
    // Cell
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "AlbumCell", for: indexPath) as! PATableViewControllerCell
        
        let item = album[indexPath.row]
        
        let url = URL(string: item.thumbnailUrls[0])
        
        cell.albumImage.sd_setImage(with: url, placeholderImage: UIImage(named: "placeholder.png"))
        
        cell.albumTitle.text = albums[indexPath.row].title
        
        return cell
    }
    

    
    // Select Cell * WEB *
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        idLoad = indexPath.row

        self.performSegue(withIdentifier: "AlbumCollectionSegue", sender: self)
    
    }
    
    func animationIn(view: UIView) {
        
        let backgroundView = self.view!
        
        backgroundView.addSubview(view)
        
        view.transform = CGAffineTransform(scaleX: 1.2, y: 1.2)
        view.alpha = 0
        view.center = backgroundView.center
        
        UIView.animate(withDuration: 0.3, animations: {
            view.transform = CGAffineTransform(scaleX: 1.0, y: 1.0)
            view.alpha = 1
        })
        
    }
    
    func animationOut(view: UIView){
        
        UIView.animate(withDuration: 0.3, animations: {
            
            view.transform = CGAffineTransform(scaleX: 1.2, y: 1.2)
            view.alpha = 0
            
        }, completion: { _ in
            
            view.removeFromSuperview()
            
        })
        
    }
    
    
    func showLoadingScreen() {
        
        animationIn(view: blurView)
        self.showSpinner(onView: self.view)
        
    }
    
    func dismissLoadingScreen() {
        
        animationOut(view: blurView)
        self.removeSpinner()
    }

}
