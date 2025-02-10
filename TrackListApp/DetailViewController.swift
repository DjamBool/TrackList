//
//  DetailViewController.swift
//  TrackListApp
//
//  Created by Игорь Мунгалов on 27.07.2022.
//

import UIKit

class DetailViewController: UIViewController {

    @IBOutlet var trackImageView: UIImageView!
    @IBOutlet var trackLabel: UILabel!
    
    var trackName: String!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        trackImageView.image = UIImage(named: trackName)
        trackLabel.text = trackName
        trackLabel.numberOfLines = 0

    }

}
