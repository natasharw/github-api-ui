//
//  UIViewController+Ext.swift
//  GithubAPIViewer
//
//  Created by Natasha Wilson on 28/12/2020.
//

import UIKit
import SafariServices

extension UIViewController {

    func presentGAVAlertOnMainThread(alertTitle: String, message: String, buttonTitle: String) {
        DispatchQueue.main.async {
            let alertVC = GAVAlertVC(alertTitle: alertTitle, message: message, buttonTitle: buttonTitle)
            alertVC.modalPresentationStyle = .overFullScreen
            alertVC.modalTransitionStyle = .crossDissolve
            self.present(alertVC, animated: true)
        }
    }


    func presentSafariVC(with url: URL) {
        let safariVC                        = SFSafariViewController(url: url)
        safariVC.preferredControlTintColor  = .systemGreen
        present(safariVC, animated: true)
    }
}
