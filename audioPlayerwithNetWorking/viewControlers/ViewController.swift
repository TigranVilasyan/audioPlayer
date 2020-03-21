//
//  ViewController.swift
//  audioPlayerwithNetWorking
//
//  Created by Tigran on 7/21/19.
//  Copyright © 2019 Tigran Vilasyan. All rights reserved.
//

import UIKit
import AVFoundation

class ViewController: UIViewController,AVAudioPlayerDelegate{
   
    var song = [Song]()
    var audioPlayer: AVAudioPlayer?
    let musicPlayer = MusicPlayer()
    var pathToMusicFile: String?
    
    @IBAction func undoAction() {
        navigationController?.popViewController(animated: true)
    }
    
    @IBOutlet weak var nextTrack: UIButton!
    @IBOutlet weak var previesTrack: UIButton!
    @IBOutlet weak var SingerLabel: UILabel!
    @IBOutlet weak var titleOfTrack: UILabel!
    @IBOutlet weak var trackImageView: UIImageView!

    @IBOutlet weak var playTracl: UIButton!
    
    @IBOutlet weak var slider: UISlider!
    
    @IBAction func playAudio(_ sender: Any) {
      let fileURL = pathToMusicFile!
             let url = URL(string: fileURL)
             do
             {
                 self.audioPlayer = try? AVAudioPlayer(contentsOf: url!)
                 audioPlayer?.prepareToPlay()
                 audioPlayer?.volume = 1.0
                 audioPlayer?.play()
             }
             catch let error as NSError
             {
                 print(error.localizedDescription)
             }
             catch {
                 print("AVAudioPlayer init failed")
             }
         }
    override func viewDidLoad() {
        super.viewDidLoad()
        song.forEach {
            let imageData = try! Data(contentsOf: $0.artworkUrl100)
            let imageView = UIImage(data: imageData)
            SingerLabel.text = $0.artistName
            titleOfTrack.text = $0.trackName
            trackImageView.image = imageView
        }
    }
}

