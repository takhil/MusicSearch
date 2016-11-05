//
//  ViewController.swift
//  MusicSearch
//
//  Created by Akhil Tirumalasetty on 9/25/16.
//  Copyright © 2016 Akhil Tirumalasetty. All rights reserved.
//

import UIKit

class ViewController: UIViewController,UIScrollViewDelegate {
    
    @IBOutlet weak var titleTextField: UITextField!
    @IBOutlet weak var scrollView: UIScrollView!
    @IBOutlet weak var pageIndicator: UIPageControl!
  
    var numberOfItems = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        pageIndicator.numberOfPages = 0
        scrollView.delegate = self
    }

    
    @IBAction func searchTitleButton(sender: AnyObject) {
        
        titleTextField.resignFirstResponder()
        
            if (titleTextField.text != ""){
            ItunesConnection.getAlbumForString(titleTextField.text!,completionHandler: { (album:Album) -> () in
                print("Album Title",album.title)
                
                self.numberOfItems += 1
                self.pageIndicator.numberOfPages = self.numberOfItems
                
            self.scrollView.contentSize = CGSizeMake(CGFloat(self.numberOfItems) * self.scrollView.frame.size.width, self.scrollView.frame.height)
                
                let musicView = NSBundle.mainBundle().loadNibNamed("MusicView", owner: self, options: nil)!.last as! MusicView
                
                
                musicView.frame = CGRectMake(CGFloat(self.numberOfItems - 1) * self.scrollView.frame.size.width, 0, self.scrollView.frame.size.width, self.scrollView.frame.size.height)
                
        // musicView.frame = CGRectMake(0, 0, self.scrollView.frame.size.width, self.scrollView.frame.size.height)

                
                musicView.updateConstraints()
                
                dispatch_async(dispatch_get_main_queue(), {()->Void in
                    
                    musicView.addDataToMusicView(album)
                    self.scrollView.addSubview(musicView)
                    self.scrollView.scrollRectToVisible(musicView.frame, animated: true)
                })
                
            })
     
        }
        else{
            print("NO TEXT ENETRED")
        }
        
        
    }
    
    func scrollViewDidEndDecelerating(scrollView: UIScrollView) {
        let page = Int(scrollView.contentOffset.x / scrollView.frame.size.width)
        pageIndicator.currentPage = page
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

