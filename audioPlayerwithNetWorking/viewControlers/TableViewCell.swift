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
    
    @IBOutlet weak var DownolandTrack: UIButton!
    
    override func awakeFromNib() {
        super.awakeFromNib()

        
    }
}


