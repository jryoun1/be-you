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

protocol CoreDataSaveModelPublishing {
    var viewContext: NSManagedObjectContext { get }
    func publisher(save action: @escaping Action) -> CoreDataSaveModelPublisher
}

extension CoreDataSaveModelPublishing {
    func publisher(save action: @escaping Action) -> CoreDataSaveModelPublisher {
        return CoreDataSaveModelPublisher(action: action, context: viewContext)
    }
}

protocol CoreDataDeleteModelPublishing {
    var viewContext: NSManagedObjectContext { get }
    func publisher(delete request: NSFetchRequest<NSFetchRequestResult>) -> CoreDataDeleteModelPublisher
}

extension CoreDataDeleteModelPublishing {
    func publisher(delete request: NSFetchRequest<NSFetchRequestResult>) -> CoreDataDeleteModelPublisher {
        return CoreDataDeleteModelPublisher(delete: request, context: viewContext)
    }
}

protocol CoreDataManaging: EntityCreating, CoreDataSaveModelPublishing, CoreDataFetchResultsPublishing, CoreDataDeleteModelPublishing {
    var viewContext: NSManagedObjectContext { get }
}

enum StorageType {
    case persistent, inMemory
}

final class CoreDataManager: CoreDataManaging {
    private let container: NSPersistentContainer
    var viewContext: NSManagedObjectContext {
        return self.container.viewContext
    }
    
    static var `default` : CoreDataManager = {
        return CoreDataManager(name: "Model", in: .persistent)
    }()
    
    init(name: String, in memory: StorageType) {
        self.container = NSPersistentContainer(name: name)
        self.setupIfMemoryStorage(memory)
        self.container.loadPersistentStores { (storeDescription, error) in
            if let error = error as NSError? {
                fatalError("Unresolved error \(error), \(error.userInfo)")
            }
        }
    }
    
    private func setupIfMemoryStorage(_ storageType: StorageType) {
        if storageType == .inMemory {
            let persistentStoreDescription = NSPersistentStoreDescription()
            persistentStoreDescription.type = NSInMemoryStoreType
            self.container.persistentStoreDescriptions = [persistentStoreDescription]
        }
    }
}
