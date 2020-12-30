//
//  UITableView+Ext.swift
//  GithubAPIViewer
//
//  Created by Natasha Wilson on 30/12/2020.
//

import UIKit

extension UITableView {

    func reloadDataOnMainThread() {
        DispatchQueue.main.async { self.reloadData() }
    }


    func removeExcessCells() {
        tableFooterView = UIView(frame: .zero)
    }
}
