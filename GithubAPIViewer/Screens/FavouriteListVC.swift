//
//  FavouriteListVC.swift
//  GHFollowers
//
//  Created by Natasha Wilson on 27/12/2020.
//

import UIKit

class FavouriteListVC: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemBlue
        
        PersistenceManager.retrieveFavourites { result in
            switch result {
            case .success(let favourites):
                print(favourites)
            case .failure(let error):
                break
            }
        }
    }
    

}
