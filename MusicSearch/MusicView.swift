//
//  MusicView.swift
//  MusicSearch
//
//  Created by Akhil Tirumalasetty on 9/25/16.
//  Copyright © 2016 Akhil Tirumalasetty. All rights reserved.
//

import UIKit

class MusicView: UIView {

    @IBOutlet weak var artWorkImageView: UIImageView!
    
    @IBOutlet weak var titleLabel: UILabel!
    
     @IBOutlet weak var artistLabel: UILabel!
    
    @IBOutlet weak var genreLabel: UILabel!
    
    func addDataToMusicView(album:Album){
        
        artWorkImageView.image = UIImage(data: NSData(contentsOfURL:NSURL(string:album.artWorkURL)!)!)
        
        titleLabel.text = album.title
        artistLabel.text = album.artist
        genreLabel.text = album.genre
        
    }

}
