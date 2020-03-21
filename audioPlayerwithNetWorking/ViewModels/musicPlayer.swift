//
//  musicPlayer.swift
//  audioPlayerwithNetWorking
//
//  Created by Tigran on 3/17/20.
//  Copyright © 2020 Tigran Vilasyan. All rights reserved.
//

import UIKit
import AVFoundation
typealias indexPathNumber = (Song?) -> ()
typealias musicPath = (String?)-> ()

class MusicPlayer {

    var action: musicPath?
    var pathArr: String?
    func DownloadMusic(_ pathToMusic: String,compilation: @escaping musicPath) {
        DownloadAudioFile.shared.downloadAndSaveAudioFile(pathToMusic) {[weak self] (music) in
            guard let _ = self,let music = music else { return }
            compilation(music)
        }
    }
}
