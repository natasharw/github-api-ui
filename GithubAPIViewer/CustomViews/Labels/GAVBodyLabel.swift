//
//  GAVBodyLabel.swift
//  GithubAPIViewer
//
//  Created by Natasha Wilson on 28/12/2020.
//

import UIKit

class GAVBodyLabel: UILabel {

    override init(frame: CGRect) {
        super.init(frame: frame)
        configure()
    }


    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }


    convenience init(textAlignment: NSTextAlignment) {
        self.init(frame: .zero)
        self.textAlignment  = textAlignment
    }


    private func configure() {
        textColor                                   = .secondaryLabel
        font                                        = UIFont.preferredFont(forTextStyle: .body)
        adjustsFontSizeToFitWidth                   = true
        minimumScaleFactor                          = 0.75
        lineBreakMode                               = .byWordWrapping
        translatesAutoresizingMaskIntoConstraints   = false
    }
}
