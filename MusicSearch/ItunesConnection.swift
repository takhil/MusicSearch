//
//  ItunesConnect.swift
//  MusicSearch
//
//  Created by Akhil Tirumalasetty on 9/25/16.
//  Copyright © 2016 Akhil Tirumalasetty. All rights reserved.
//

import UIKit

class ItunesConnection: NSObject {
    
    class func getAlbumForString(searchString:String,completionHandler:(Album)->()){
        
        let escapedString = searchString.stringByAddingPercentEncodingWithAllowedCharacters(NSCharacterSet.URLHostAllowedCharacterSet())
        
        let itunesUrl:String = "https://itunes.apple.com/search?term=\(escapedString!)&media=music"
        
        
        let url = NSURL(string: itunesUrl)
        
        let task = NSURLSession.sharedSession().dataTaskWithURL(url!, completionHandler:{(data, response, error) -> Void in
            
            if(error == nil){
                do {
                    let itunesDict = try NSJSONSerialization.JSONObjectWithData(data!, options: NSJSONReadingOptions.MutableContainers) as? NSDictionary
                    
                    let resultArray = itunesDict?.objectForKey("results") as! [AnyObject]
                    
//                     print("itunesDict::",itunesDict)
//                     print("resultArray::",resultArray)
                    
                    if (resultArray.count > 0){
                        if let resultDict = resultArray.first{
                            let artist = resultDict["artistName"] as! String
                            let genre = resultDict["primaryGenreName"] as! String
                            let artWorkURL = resultDict["artworkUrl100"] as! String
                            let albumtitle = resultDict["collectionName"] as! String
                            
                            let album = Album(title:albumtitle, artist:artist, genre: genre, artWorkURL:artWorkURL)
                            
                            completionHandler(album)
                            
                        }
                        
                    }
  
                    
                } catch let error as NSError {
                    print("error processing json data: \(error.localizedDescription)")
                }
                
            }
            else{
                print("Error details:: \(error!.localizedDescription)")
            }
            
        })
        task.resume()
        
    }

}
