//
//  VideoViewController.swift
//  ThumbStagram
//
//  Created by jake on 2018. 7. 27..
//  Copyright © 2018년 jake. All rights reserved.
//

import UIKit
import Player

class VideoViewController: DetailViewController,PlayerDelegate,PlayerPlaybackDelegate {
    
    @IBOutlet weak var viewBase: UIView!
    
    var player = Player()
    override func viewDidLoad() {
        super.viewDidLoad()
        if contentData != nil {
            self.setViews()
        }
    }
    override func setViews() {
        super.setViews()
        self.player.playerDelegate = self
        self.player.playbackDelegate = self
        self.player.view.frame = self.viewBase.bounds
        
        self.addChildViewController(self.player)
        self.viewBase.addSubview(self.player.view)
        self.player.didMove(toParentViewController: self)
        if let videoUrl = URL(string: self.contentData!.videos.standardResolution!.url) {
            self.player.url = videoUrl
        }
    }
    
    //MARK: -player
    func playerCurrentTimeDidChange(_ player: Player) {
        //
    }
    
    func playerPlaybackWillStartFromBeginning(_ player: Player) {
        //
    }
    
    func playerPlaybackDidEnd(_ player: Player) {
        //
    }
    
    func playerPlaybackWillLoop(_ player: Player) {
        //
    }
    
    func playerReady(_ player: Player) {
        //
        player.playFromBeginning()
    }
    
    func playerPlaybackStateDidChange(_ player: Player) {
        //
    }
    
    func playerBufferingStateDidChange(_ player: Player) {
        //
    }
    
    func playerBufferTimeDidChange(_ bufferTime: Double) {
        //
    }
}
