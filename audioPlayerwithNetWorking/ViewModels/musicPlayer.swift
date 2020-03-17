//
//  musicPlayer.swift
//  audioPlayerwithNetWorking
//
//  Created by Tigran on 3/17/20.
//  Copyright © 2020 Tigran Vilasyan. All rights reserved.
//

import UIKit

typealias indexPathNumber = (Song?) -> ()

class MusicPlayer {

    var action: indexPathNumber?
    
    func DownloadMusic(_ pathToMusic: String) {
        DownloadAudioFile.shared.downloadAndSaveAudioFile(pathToMusic) {[weak self] (music) in
            guard let self = self, let music = music else { return }
            
        }
    }
}
