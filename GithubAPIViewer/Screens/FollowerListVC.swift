//
//  FollowerListVC.swift
//  GithubAPIViewer
//
//  Created by Natasha Wilson on 27/12/2020.
//

import UIKit

class FollowerListVC: UIViewController {
    
    var username: String!

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemBackground
        navigationController?.navigationBar.prefersLargeTitles = true
        
        NetworkManager.shared.getFollowers(forUsername: username, page: 1) { (followers, errorMessage) in
            guard let followers = followers else {
                self.presentGAVAlertOnMainThread(alertTitle: "Bad stuff happened", message: errorMessage!, buttonTitle: "Ok")
                return
            }
            
            print("Followers.count = \(followers.count)")
            print(followers)
        }
    }
    
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationController?.setNavigationBarHidden(false, animated: true)
    }
}
