//
//  DateFormatterExtension.swift
//  be-you
//
//  Created by wonhee on 2021/10/05.
//

import Foundation

extension DateFormatter {
    static let dateToYMD: DateFormatter = {
        let  dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yy.MM.dd"
        return dateFormatter
    }()

    static let dateToDay: DateFormatter = {
        let dateFormatter = DateFormatter()
        dateFormatter.locale = Locale(identifier:"ko_KR")
        dateFormatter.dateFormat = "EEEE"
        return dateFormatter
    }()
}
