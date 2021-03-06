//
//  FavouriteCell.swift
//  GithubAPIViewer
//
//  Created by Natasha Wilson on 29/12/2020.
//

import UIKit

class FavouriteCell: UITableViewCell {

    static let reuseID = "FavouriteCell"

    let avatarImageView = GAVAvatarImageView(frame: .zero)
    let usernameLabel   = GAVTitleLabel(textAlignment: .left, fontSize: 26)


    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        configure()
    }


    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }


    func set(favourite: Follower) {
        avatarImageView.downloadImage(fromURL: favourite.avatarUrl)
        usernameLabel.text = favourite.login
    }


    private func configure() {
        addSubviews(avatarImageView, usernameLabel)
        accessoryType           = .disclosureIndicator
        let padding: CGFloat    = 12

        NSLayoutConstraint.activate([
            avatarImageView.centerYAnchor.constraint(equalTo: self.centerYAnchor),
            avatarImageView.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: padding),
            avatarImageView.heightAnchor.constraint(equalToConstant: 60),
            avatarImageView.widthAnchor.constraint(equalToConstant: 60),
            
            usernameLabel.centerYAnchor.constraint(equalTo: self.centerYAnchor),
            usernameLabel.leadingAnchor.constraint(equalTo: avatarImageView.trailingAnchor, constant: 24),
            usernameLabel.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -padding),
            usernameLabel.heightAnchor.constraint(equalToConstant: 40)
        ])
    }
}
