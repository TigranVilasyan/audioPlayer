//
//  ModelInfo.swift
//  audioPlayerwithNetWorking
//
//  Created by Tigran on 7/23/19.
//  Copyright © 2019 Tigran Vilasyan. All rights reserved.
//

import Foundation

struct Result: Codable {
    let resultCount: Int
    let results: [Song]
}

struct Song: Codable {
    let trackName: String
    let artistName: String
    let artworkUrl100: URL
    let trackViewUrl: URL
}
