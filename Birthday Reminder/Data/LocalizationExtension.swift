//
//  LocalizationExtension.swift
//  Birthday Reminder
//
//  Created by Timo Reusch on 01.01.22.
//

import Foundation

extension String{
    func localized() -> String {
        return NSLocalizedString(self, tableName: "Localizable", bundle: .main, value: self, comment: self)
    }
}
