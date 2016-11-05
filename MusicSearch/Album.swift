//
//  Album.swift
//  MusicSearch
//
//  Created by Akhil Tirumalasetty on 9/25/16.
//  Copyright © 2016 Akhil Tirumalasetty. All rights reserved.
//

import UIKit

class Album: NSObject {
    
    var title:String!
    var artist:String!
    var genre:String!
    var artWorkURL:String!
    
    init(title:String,artist:String,genre:String,artWorkURL:String){
        
        
        self.title = title
        self.artist = artist
        self.genre = genre
        self.artWorkURL = artWorkURL
        
    }
    

}
