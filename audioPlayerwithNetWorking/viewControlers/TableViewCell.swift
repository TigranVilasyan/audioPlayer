//
//  TableViewCell.swift
//  audioPlayerwithNetWorking
//
//  Created by Tigran on 7/27/19.
//  Copyright © 2019 Tigran Vilasyan. All rights reserved.
//

import UIKit

class TableViewCell: UITableViewCell {
    @IBOutlet weak var title: UILabel!
    
    @IBOutlet weak var artist: UILabel!
    @IBOutlet weak var progress: UIButton!
    @IBAction func downolandTrack(_ sender: Any) {
        downolandTrack.forEach { (btn) in
            if btn.isEnabled == true {
                
            }
        }
    }
    @IBOutlet var downolandTrack: [UIButton]!
    
}


