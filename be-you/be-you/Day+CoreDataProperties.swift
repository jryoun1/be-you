//
//  Day+CoreDataProperties.swift
//  be-you
//
//  Created by Yeon on 2021/11/01.
//
//

import Foundation
import CoreData


extension Day {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Day> {
        return NSFetchRequest<Day>(entityName: "Day")
    }

    @NSManaged public var date: Date?
    @NSManaged public var diary: String?
    @NSManaged public var rgbHEX: String?
    @NSManaged public var hashtags: [String]?

}

extension Day : Identifiable {

}
