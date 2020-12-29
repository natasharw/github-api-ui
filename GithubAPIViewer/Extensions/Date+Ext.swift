//
//  Date+Ext.swift
//  GithubAPIViewer
//
//  Created by Natasha Wilson on 29/12/2020.
//

import Foundation

extension Date {
    
    func convertToMonthYearFormat() -> String {
        let dateFormatter           = DateFormatter()
        dateFormatter.dateFormat    = "MMM yyyy"
        
        return dateFormatter.string(from: self)
    }
}
