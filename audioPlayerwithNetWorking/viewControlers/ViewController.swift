//
//  ViewController.swift
//  audioPlayerwithNetWorking
//
//  Created by Tigran on 7/21/19.
//  Copyright © 2019 Tigran Vilasyan. All rights reserved.
//

import UIKit
import AVFoundation

class ViewController: UIViewController{
   
    var song = [Song]()
    
    @IBAction func undoAction() {
        navigationController?.popViewController(animated: true)
    }
    @IBAction func playButton(_ sender: Any) {
    }
    @IBOutlet weak var nextTrack: UIButton!
    @IBOutlet weak var previesTrack: UIButton!
    @IBOutlet weak var SingerLabel: UILabel!
    @IBOutlet weak var titleOfTrack: UILabel!
    @IBOutlet weak var trackImageView: UIImageView!
    
    @IBOutlet weak var slider: UISlider!
    
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

