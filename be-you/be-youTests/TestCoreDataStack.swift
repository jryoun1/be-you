//
//  TestCoreDataStack.swift
//  TestCoreDataStack
//
//  Created by Yeon on 2021/09/14.
//

import XCTest
import CoreData
import Combine
@testable import be_you

final class TestCoreDataStack: XCTestCase {
    private var dayList: [Day]!
    private var bag: [AnyCancellable]!
    private var coreDataManager: CoreDataManager!
    
    override func setUp() {
        super.setUp()
        dayList = []
        bag = []
        coreDataManager = CoreDataManager(name: "Model", in: .inMemory)
    }

    override func tearDown() {
        super.tearDown()
        coreDataManager = nil
        dayList = []
        bag = []
    }
}
