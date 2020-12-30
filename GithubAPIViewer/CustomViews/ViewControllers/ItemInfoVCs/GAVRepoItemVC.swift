//
//  GAVRepoItemVC.swift
//  GithubAPIViewer
//
//  Created by Natasha Wilson on 29/12/2020.
//

import UIKit

protocol GAVRepoInfoVCDelegate: class {
    func didTapGithubProfile(for user: User)
}

class GAVRepoItemVC: GAVItemInfoVC {

    weak var delegate: GAVRepoInfoVCDelegate!


    init(user: User, delegate: GAVRepoInfoVCDelegate) {
        super.init(user: user)
        self.delegate = delegate
    }


    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }


    override func viewDidLoad() {
        super.viewDidLoad()
        configureItems()
    }


    private func configureItems() {
        itemInfoViewOne.set(itemInfoType: .repos, with: user.publicRepos)
        itemInfoViewTwo.set(itemInfoType: .gists, with: user.publicGists)
        actionButton.set(backgroundColor: .systemPurple, title: "Github Profile")
    }


    override func actionButtonTapped() {
        delegate.didTapGithubProfile(for: user)
    }
}
