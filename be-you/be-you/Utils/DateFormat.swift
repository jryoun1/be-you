//
//  DateFormat.swift
//  be-you
//
//  Created by wonhee on 2021/10/04.
//

import Foundation

struct DateFormat {
    static func ymd(_ date: Date = Date()) -> String {
        let formatter = DateFormatter()
        formatter.dateFormat = "yy.MM.dd"
        return formatter.string(from: date)
    }

    static func day(_ date: Date = Date()) -> String {
        let formatter = DateFormatter()
        formatter.locale = Locale(identifier:"ko_KR")
        formatter.dateFormat = "EEEE"
        return formatter.string(from: date)
    }
}
