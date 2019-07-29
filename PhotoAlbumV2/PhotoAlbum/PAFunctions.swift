//
//  PAFunctions.swift
//  AsincDataLoaderTest
//
//  Created by Emanuel Dumitrescu on 28/07/2019.
//  Copyright © 2019 Emanuel Dumitrescu. All rights reserved.
//

import Foundation


public func jsonDownloader(urladdress: String) {
    
    let session = URLSession.shared
    let url = URL(string: urladdress)!
    
    let task = session.dataTask(with: url) { data, response, error in
        
        if error != nil || data == nil {
            print("Client error!")
            return
        }
        
        guard let response = response as? HTTPURLResponse, (200...299).contains(response.statusCode) else {
            print("Server error!")
            return
        }
        
        guard let mime = response.mimeType, mime == "application/json" else {
            print("Wrong MIME type!")
            return
        }
        
        do {
            let json = try JSONSerialization.jsonObject(with: data!, options: [])
            guard let jsonArray = json as? [[String: Any]] else {
                return
            }
            if urladdress == "https://jsonplaceholder.typicode.com/albums" {
                

                for dic in jsonArray{
                    albums.append(Album(dic)) // adding now value in Model array
                }
   
                
            }
            
            if urladdress == "https://jsonplaceholder.typicode.com/photos" {
                
                
                for dic in jsonArray{
                    photos.append(Photo(dic)) // adding now value in Model array
                }
                
            }
            
            
            
        } catch {
            print("JSON error: \(error.localizedDescription)")
        }
    }
    
    task.resume()
}

public func albumCreator() {
    
    var photoLast = 0
    var photoCouter = 0
    
    
    for i in 0...albums.count-1 {
        
        albumCreator(id: i)
        
        for j in photoLast...photos.count-1 {
            
            if i+1 == photos[j].albumId {
                
            album[i].titles.append(photos[j].title)
            album[i].urls.append(photos[j].url)
            album[i].thumbnailUrls.append(photos[j].thumbnailUrl)
                
            photoCouter = j
            
            }
            
        }
        
        photoLast = photoCouter
        
    }
    
    print(album[0])
    
}

public func albumCreator(id: Int){
    
    
    album.append(Albums(["albumId" : id+1]))
    album[id].titles.removeFirst()
    album[id].urls.removeFirst()
    album[id].thumbnailUrls.removeFirst()
    
    
}


public func isNetAvailable() -> Bool {
    
    var netAvailableStatus = false
    
    if PAInternetTest.Connection() != false {
        
        netAvailableStatus = true
        
    }
    
    return netAvailableStatus
    
}
