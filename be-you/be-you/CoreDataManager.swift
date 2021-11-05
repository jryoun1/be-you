//
//  CoreDataManager.swift
//  be-you
//
//  Created by Yeon on 2021/11/03.
//

import CoreData

extension NSManagedObject {
    static var entityName: String {
        return String(describing: self)
    }
}
