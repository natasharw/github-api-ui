//
//  GAVEmptyStateView.swift
//  GithubAPIViewer
//
//  Created by Natasha Wilson on 28/12/2020.
//

import UIKit

class GAVEmptyStateView: UIView {

    let messageLabel    = GAVTitleLabel(textAlignment: .center, fontSize: 28)
    let logoImageView   = UIImageView()


    override init(frame: CGRect) {
        super.init(frame: frame)
        configure()
    }


    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }


    convenience init(message: String) {
        self.init(frame: .zero)
        messageLabel.text = message
    }


    private func configure() {
        addSubviews(logoImageView, messageLabel)
        configureLogoImageView()
        configureMessageLabel()
    }


    private func configureLogoImageView() {
        logoImageView.image         = Images.emptyStateLogo
        logoImageView.translatesAutoresizingMaskIntoConstraints = false

        let labelBottomConstant: CGFloat = DeviceTypes.isiPhoneSE || DeviceTypes.isiPhone8Zoomed ? 80 : 40

        NSLayoutConstraint.activate([
            logoImageView.widthAnchor.constraint(equalTo: self.widthAnchor, multiplier: 1.3),
            logoImageView.heightAnchor.constraint(equalTo: self.widthAnchor, multiplier: 1.3),
            logoImageView.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: 170),
            logoImageView.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: labelBottomConstant)
        ])
    }


    private func configureMessageLabel() {
        messageLabel.numberOfLines  = 3
        messageLabel.textColor      = .secondaryLabel

        let labelCenterYConstant: CGFloat = DeviceTypes.isiPhoneSE || DeviceTypes.isiPhone8Zoomed ? -80 : -150


        NSLayoutConstraint.activate([
            messageLabel.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 40),
            messageLabel.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -40),
            messageLabel.heightAnchor.constraint(equalToConstant: 200),
            messageLabel.centerYAnchor.constraint(equalTo: self.centerYAnchor, constant: labelCenterYConstant)
        ])
    }
}
