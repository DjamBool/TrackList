//
//  TrackListViewController.swift
//  TrackListApp
//
//  Created by Игорь Мунгалов on 27.07.2022.
//

import UIKit

class TrackListViewController: UITableViewController {
 
    var trackList = [
        "Alberto Ruiz - 7 Elements (Original Mix)",
        "Dave Wincent - Red Eye (Original Mix)",
        "E-Spectro - End Station (Original Mix)",
        "Edna Ann - Phasma (Konstantin Yoodza Remix)",
        "Ilija Djokovic - Delusion (Original Mix)",
        "John Baptiste - Mycelium (Original Mix)",
        "Lane 8 - Fingerprint (Original Mix)",
        "Mac Vaughn - Pink Is My Favorite Color (Alex Stein Remix)",
        "Metodi Hristov, Gallya - Badmash (Original Mix)",
        "Veerus, Maxie Devine - Nightmare (Original Mix)"
    ]

    override func viewDidLoad() {
        super.viewDidLoad()
        // кнопка Edit
        navigationItem.leftBarButtonItem = editButtonItem
    }
    // MARK: - Table view data source

// вместо удаления - закомментировал
    // override func numberOfSections(in tableView: UITableView) -> Int {
//        // #warning Incomplete implementation, return the number of sections
//        return 0
//    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        print(trackList.count)
        return trackList.count
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "trackName", for: indexPath)
        cell.textLabel?.text = trackList[indexPath.row]
        cell.textLabel?.numberOfLines = 0
        cell.imageView?.image = UIImage(named: trackList[indexPath.row])
        return cell
    }
    
// MARK: - Table View Delegate
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 60
    }
    
    // перетащить строку
    override func tableView(_ tableView: UITableView, moveRowAt sourceIndexPath: IndexPath, to destinationIndexPath: IndexPath) {
        let currentTrack = trackList.remove(at: sourceIndexPath.row)
        trackList.insert(currentTrack, at: destinationIndexPath.row)
        tableView.reloadData()
    }
    
    // убрать "кирпичи"
    override func tableView(_ tableView: UITableView, editingStyleForRowAt indexPath: IndexPath) -> UITableViewCell.EditingStyle {
        return .none
    }
    

    // MARK: - Navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let indePath = tableView.indexPathForSelectedRow {
            let detailVC = segue.destination as! DetailViewController
            detailVC.trackName = trackList[indePath.row]
        }
    }

}
