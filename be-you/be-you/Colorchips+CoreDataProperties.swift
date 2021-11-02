//
//  Colorchips+CoreDataProperties.swift
//  be-you
//
//  Created by Yeon on 2021/11/01.
//
//

import Foundation
import CoreData


extension Colorchips {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Colorchips> {
        return NSFetchRequest<Colorchips>(entityName: "Colorchips")
    }

    @NSManaged public var mood: String?
    @NSManaged public var chips: [String]?

}

extension Colorchips : Identifiable {

}
