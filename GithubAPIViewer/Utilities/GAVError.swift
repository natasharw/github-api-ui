//
//  GAVError.swift
//  GithubAPIViewer
//
//  Created by Natasha Wilson on 29/12/2020.
//

import Foundation

enum GAVError: String, Error {
    case invalidUsername        = "This username created an invalid request, please try again"
    case unableToComplete       = "Unable to complete your request. Please check your internet connection"
    case invalidResponse        = "Invalid response from the server. Please try again"
    case invalidData            = "The data received from the server was invalid. Please try again"
    case invalidUserURL         = "The URL for this user is invalid"
    case userHasNoFollowers     = "This user has no followers"
    case unableToFavourite      = "There was an error add this user to your favourites"
    case alreadyInFavourites    = "This user was already in your favourites"
}

