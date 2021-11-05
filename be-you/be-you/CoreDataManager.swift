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

protocol EntityCreating {
    var viewContext: NSManagedObjectContext { get }
    func createEntity<T: NSManagedObject>() -> T
}

extension EntityCreating {
    func createEntity<T: NSManagedObject>() -> T {
        T(context: viewContext)
    }
}

protocol CoreDataFetchResultsPublishing {
    var viewContext: NSManagedObjectContext { get }
    func publisher<T: NSManagedObject>(fetch request: NSFetchRequest<T>) -> CoreDataFetchResultsPublisher<T>
}

extension CoreDataFetchResultsPublishing {
    func publisher<T: NSManagedObject>(fetch request: NSFetchRequest<T>) -> CoreDataFetchResultsPublisher<T> {
        return CoreDataFetchResultsPublisher(request: request, context: viewContext)
    }
}
