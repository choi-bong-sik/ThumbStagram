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
    @IBOutlet weak var btnPlay: UIButton!
    @IBOutlet weak var btnPause: UIButton!
    @IBOutlet weak var btnStop: UIButton!
    @IBOutlet weak var btnSpeak: UIButton!
    
    var player = Player()
    override func viewDidLoad() {
        super.viewDidLoad()
        if contentData != nil {
            self.setViews()
            self.setPlayer()
        }
    }
    override func setViews() {
        super.setViews()

    }
    func setPlayer(){
        self.player.playerDelegate = self
        self.player.playbackDelegate = self
        self.player.view.frame = self.viewBase.bounds
        self.player.view.backgroundColor = .clear
        self.addChildViewController(self.player)
        self.player.playbackLoops = true
        self.viewBase.addSubview(self.player.view)
        self.player.didMove(toParentViewController: self)
        if let videoUrl = URL(string: self.contentData!.videos.standardResolution!.url) {
            self.player.url = videoUrl
        }
    }
    
    //MARK: - IBAction
    @IBAction func pressPlay(_ sender: UIButton) {
        player.playFromBeginning()
    }
    @IBAction func pressPause(_ sender: UIButton) {
        player.pause()
    }
    @IBAction func pressStop(_ sender: UIButton) {
        player.stop()
    }
    @IBAction func pressSpeak(_ sender: UIButton){
        if player.muted {
            player.muted = false
            self.btnSpeak.setTitle("Speak", for: UIControlState.normal)
        }else{
            player.muted = true
            self.btnSpeak.setTitle("Mute", for: UIControlState.normal)
        }
    }
    
    //MARK: - player
    func playerCurrentTimeDidChange(_ player: Player) {
    }
    
    func playerPlaybackWillStartFromBeginning(_ player: Player) {
    }
    
    func playerPlaybackDidEnd(_ player: Player) {
    }
    
    func playerPlaybackWillLoop(_ player: Player) {
    }
    
    func playerReady(_ player: Player) {
        self.btnPlay.isEnabled = true
        self.btnPause.isEnabled = true
        self.btnStop.isEnabled = true
        self.btnSpeak.isEnabled = true
    }
    
    func playerPlaybackStateDidChange(_ player: Player) {
    }
    
    func playerBufferingStateDidChange(_ player: Player) {
    }
    
    func playerBufferTimeDidChange(_ bufferTime: Double) {
    }
}
