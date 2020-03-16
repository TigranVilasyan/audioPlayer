//
//  TestViewController.swift
//  audioPlayerwithNetWorking
//
//  Created by Tigran on 7/24/19.
//  Copyright © 2019 Tigran Vilasyan. All rights reserved.
//

import UIKit

class TestViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        SongsManager.shared.requestSongs("Linkin") { songs in
            print(songs ?? [])
    }
}
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
