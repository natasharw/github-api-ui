//
//  GAVFollowerItemVC.swift
//  GithubAPIViewer
//
//  Created by Natasha Wilson on 29/12/2020.
//

import UIKit

class GAVFollowerItemVC: GAVItemInfoVC {
        
    override func viewDidLoad() {
        super.viewDidLoad()
        configureItems()
    }
    
    
    private func configureItems() {
        itemInfoViewOne.set(itemInfoType: .followers, with: user.followers)
        itemInfoViewTwo.set(itemInfoType: .following, with: user.following)
        actionButton.set(backgroundColor: .systemPurple, title: "Get Followers")
    }
}