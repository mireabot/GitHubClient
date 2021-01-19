//
//  UserDetailsViewController.swift
//  GitDemo
//
//  Created by Mikhail Kolkov on 14.01.21.

import UIKit

class UserDetailsViewController: UIViewController {

    @IBOutlet weak var userImageView: UIImageView!
    @IBOutlet weak var watchersLabel: UILabel!
    @IBOutlet weak var issuesLabel: UILabel!
    @IBOutlet weak var forksLabel: UILabel!
    @IBOutlet weak var starGazeLabel: UILabel!
    @IBOutlet weak var starGazeCount: UILabel!
    @IBOutlet weak var forksCount: UILabel!
    @IBOutlet weak var issuesCount: UILabel!
    @IBOutlet weak var language: UILabel!
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var descLabel: UILabel!
    
    public var items: Item?

    override func viewDidLoad() {
        super.viewDidLoad()
        addData()
        setUP()
        // Do any additional setup after loading the view.
    }
    
    internal func setUP() {
        guard let image = userImageView else { return }
        userImageView.layer.cornerRadius = image.frame.size.width / 2
        userImageView.clipsToBounds = true
        watchersLabel.layer.cornerRadius = 10
        watchersLabel.layer.masksToBounds = true
        issuesLabel.layer.cornerRadius = 10
        issuesLabel.layer.masksToBounds = true
        forksLabel.layer.cornerRadius = 10
        forksLabel.layer.masksToBounds = true
        starGazeLabel.layer.cornerRadius = 10
        starGazeLabel.layer.masksToBounds = true
    }

    private func addData() {
        guard let fileUrl = URL(string: (items?.owner.avatarURL ?? "")) else { return }
        ImageLoader.image(for: fileUrl) { image in
            self.userImageView.image = image
        }
        starGazeCount.text = "\(items?.stargazersCount ?? 0)"
        forksCount.text = "\(items?.forks ?? 0)"
        issuesCount.text = "\(items?.open_issues ?? 0)"
        language.text = "\(items?.language ?? "")"
        nameLabel.text = items?.name ?? ""
        descLabel.text = items?.itemDescription ?? ""
    }
}


