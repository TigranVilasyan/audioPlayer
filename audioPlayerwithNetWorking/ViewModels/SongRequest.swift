//
//  SongRequest.swift
//  audioPlayerwithNetWorking
//
//  Created by Tigran on 3/14/20.
//  Copyright © 2020 Tigran Vilasyan. All rights reserved.
//

import UIKit

typealias passArrData = ([Song]?) -> ()
typealias passSongInfo = (String) -> ()

class SongRequest {
    
    func getRequest(_ content: String,compilation:@escaping (passArrData)) {
        SongsManager.shared.requestSong(content) { [weak self] (songs) in
            guard let self = self, let songs = songs else { return }
            compilation(songs)
        }
    }
}
