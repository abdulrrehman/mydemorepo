//
//  GenreViewController.swift
//  musicPlayer
//
//  Created by Abdul Rehman on 6/26/18.
//  Copyright © 2018 Abdul Rehman. All rights reserved.
//

import UIKit
import MediaPlayer

class GenreViewController: UIViewController {
 @IBOutlet weak var nextButtonTapped: UIButton!
    override func viewDidLoad() {
        super.viewDidLoad()
    }

    var musicPlayer = MPMusicPlayerController.applicationMusicPlayer
    
    
    @IBAction func musicButtonTapped(_ sender: UIButton) {
        
        MPMediaLibrary.requestAuthorization { (status) in
            if status == .authorized {
                self.playGenre(genre: sender.currentTitle!)
                
            }
        }
        
    
    }
    
    @IBAction func stopButtonTapped(_ sender: UIButton) {
    musicPlayer.stop()
    }
    
   
    @IBAction func nextButtonTapped(_ sender: UIButton) {
    musicPlayer.skipToNextItem()
    }
    
    func playGenre(genre: String)
    {
        musicPlayer.stop()
        let query = MPMediaQuery()
        let predicate = MPMediaPropertyPredicate(value: genre, forProperty: MPMediaItemPropertyGenre)
        query.addFilterPredicate(predicate)
        
        musicPlayer.setQueue(with: query)
        musicPlayer.shuffleMode = .songs
        musicPlayer.play()
        
        
    }
    
    
}
