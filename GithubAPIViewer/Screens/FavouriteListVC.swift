//
//  FavouriteListVC.swift
//  GHFollowers
//
//  Created by Natasha Wilson on 27/12/2020.
//

import UIKit

class FavouriteListVC: GAVDataLoadingVC {

    let tableView               = UITableView()
    var favourites: [Follower]  = []


    override func viewDidLoad() {
        super.viewDidLoad()
        configureViewController()
        configureTableView()
    }


    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        getFavourites()
    }


    func configureViewController() {
        view.backgroundColor    = .systemBackground
        title                   = "Favourites"
        navigationController?.navigationBar.prefersLargeTitles = true
    }


    func configureTableView() {
        view.addSubview(tableView)
        tableView.frame         = view.bounds
        tableView.rowHeight     = 80
        tableView.delegate      = self
        tableView.dataSource    = self
        tableView.removeExcessCells()

        tableView.register(FavouriteCell.self, forCellReuseIdentifier: FavouriteCell.reuseID)
    }


    func getFavourites() {
        PersistenceManager.retrieveFavourites { [weak self] result in
            guard let self = self else { return }

            switch result {
            case .success(let favourites):
                self.updateUI(with: favourites)

            case .failure(let error):
                self.presentGAVAlertOnMainThread(alertTitle: "Something went wrong", message: error.rawValue, buttonTitle: "Ok")
            }
        }
    }


    func updateUI(with favourites: [Follower]) {
        if favourites.isEmpty {
            self.showEmptyStateView(with: "No users have been added to favourites yet", in: self.view)
        } else {
            self.favourites = favourites
            DispatchQueue.main.async {
                self.tableView.reloadData()
                self.view.bringSubviewToFront(self.tableView)
            }
        }
    }
}


extension FavouriteListVC: UITableViewDataSource, UITableViewDelegate {

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return favourites.count
    }


    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: FavouriteCell.reuseID) as! FavouriteCell
        let favourite = favourites[indexPath.row]
        cell.set(favourite: favourite)
        return cell
    }


    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let favourite       = favourites[indexPath.row]
        let destVC          = FollowerListVC(username: favourite.login)
        
        navigationController?.pushViewController(destVC, animated: true)
    }


    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        guard editingStyle == .delete else { return }

        PersistenceManager.updateWith(favourite: favourites[indexPath.row], actionType: .remove) { [weak self] error in
            guard let self = self else { return }

            guard let error = error else {
                self.favourites.remove(at: indexPath.row)
                tableView.deleteRows(at: [indexPath], with: .left)
                return
            }

            self.presentGAVAlertOnMainThread(alertTitle: "Unable to remove", message: error.rawValue, buttonTitle: "Ok")
        }
    }
}
