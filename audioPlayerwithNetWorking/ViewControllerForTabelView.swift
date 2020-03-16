//
//  ViewControllerForTabelView.swift
//  audioPlayerwithNetWorking
//
//  Created by Tigran on 7/22/19.
//  Copyright © 2019 Tigran Vilasyan. All rights reserved.
//

import UIKit

class ViewControllerForTabelView: UIViewController,UITableViewDelegate,UITableViewDataSource {
    
    
    var tabelview: UITableView!
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        <#code#>
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        <#code#>
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tabelview.delegate = self
        tabelview.dataSource = self
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
