//
//  String+Ext.swift
//  GithubAPIViewer
//
//  Created by Natasha Wilson on 29/12/2020.
//

import Foundation

extension String {

    func convertToDate() -> Date? {
        let dateFormatter           = DateFormatter()
        dateFormatter.dateFormat    = "yyyy-MM-dd'T'HH:mm:ssZ"
        dateFormatter.locale        = Locale(identifier: "en-gb")
        dateFormatter.timeZone      = .current

        return dateFormatter.date(from: self)
    }

    func convertToDisplayFormat() -> String {
        guard let date = self.convertToDate() else { return "Unknown" }

        return date.convertToMonthYearFormat()
    }

}
