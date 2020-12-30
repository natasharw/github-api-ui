//
//  GAVFollowerItemVC.swift
//  GithubAPIViewer
//
//  Created by Natasha Wilson on 29/12/2020.
//

import UIKit

protocol GAVFollowerItemVCDelegate: class {
    func didTapGetFollowers(for user: User)
}

class GAVFollowerItemVC: GAVItemInfoVC {
    
    weak var delegate: GAVFollowerItemVCDelegate!
        
    override func viewDidLoad() {
        super.viewDidLoad()
        configureItems()
    }
    
    
    private func configureItems() {
        itemInfoViewOne.set(itemInfoType: .followers, with: user.followers)
        itemInfoViewTwo.set(itemInfoType: .following, with: user.following)
        actionButton.set(backgroundColor: .systemTeal, title: "Get Followers")
    }
    
    
    override func actionButtonTapped() {
        delegate.didTapGetFollowers(for: user)
    }
}
