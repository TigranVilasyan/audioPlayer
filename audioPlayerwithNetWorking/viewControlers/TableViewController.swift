//
//  TableViewController.swift
//  audioPlayerwithNetWorking
//
//  Created by Tigran on 7/27/19.
//  Copyright © 2019 Tigran Vilasyan. All rights reserved.
//

import UIKit
import Foundation

class TableViewController: UITableViewController, UISearchBarDelegate {
    
    @IBOutlet weak var searchBar: UISearchBar!
    var downloadTask: URLSessionDownloadTask!
    var backgroundSession: URLSession!
    var songs = [Song]()
    var info: Song?
    var action: passSongInfo?
    func searchBarTextDidBeginEditing(_ searchBar: UISearchBar) {
        guard let searchText = searchBar.text, !searchText.isEmpty else { return }
        self.searchBar.resignFirstResponder()
        SongRequest.shared.getRequest(searchText) { (songs) in
            guard let songs = songs else { return }
            self.songs = songs
            self.tableView.reloadData()
        }
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        searchBar.delegate = self
    }
    
    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
        guard let searchText = searchBar.text, !searchText.isEmpty else { return }
        searchBar.resignFirstResponder()
        SongRequest.shared.getRequest(searchText) {(songs) in
            guard let songs = songs else { return }
            self.songs = songs
            self.tableView.reloadData()
        }
        
    }
    
    @IBAction func DownolandTrack(_ sender: Any) {
        
        let url = URL(string: "\(String(describing: info?.previewUrl))")
        downloadTask = backgroundSession.downloadTask(with: url!)
        downloadTask.resume()
        
    }
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        navigationController?.navigationBar.isHidden = true
        return songs.count
    }
    
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard  let cell: TableViewCell = tableView.dequeueReusableCell(withIdentifier: "TableViewCell", for: indexPath) as? TableViewCell  else { return UITableViewCell() }
        let song = songs[indexPath.row]
        cell.artist.text = song.artistName
        cell.title.text = song.trackName
        return cell
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let song = songs[indexPath.row]
        if #available(iOS 13.0, *) {
            let str = UIStoryboard(name: "Main", bundle: nil)
            let vc = str.instantiateViewController(identifier: "ViewController") as? ViewController
            vc?.song.append(song)
            navigationController?.pushViewController(vc!, animated: true)
        } else {
            // Fallback on earlier versions
        }
    }
}
