//
//  Extensions.swift
//  FictAdvisor
//
//  Created by Jeytery on 18.04.2022.
//

import Foundation

extension String {
    var localized: String {
        return NSLocalizedString(
            self,
            tableName: "Localize",
            bundle: .main,
            value: self,
            comment: self
        )
    }
}
