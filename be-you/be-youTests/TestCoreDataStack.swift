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
    
    func testSaveDayModel() {
        expectation(forNotification: .NSManagedObjectContextDidSave,
                    object: coreDataManager.viewContext) { _ in
            return true
        }
        
        let action: Action = {
            let day: Day = self.coreDataManager.createEntity()
            day.hashtags = ["빡침", "짜증나", "퇴사"]
            day.date = Date()
            day.diary = "정말 화가 많이 난다,, 퇴사하고 싶다"
            day.rgbHEX = "AB4253"
        }
        
        coreDataManager
            .publisher(save: action)
            .sink { completion in
                if case .failure(let error) = completion {
                    print(error.localizedDescription)
                }
            } receiveValue: { success in
                XCTAssertTrue(success)
            }
            .store(in: &bag)
        
        waitForExpectations(timeout: 2.0) { error in
            XCTAssertNil(error, "저장 안됨")
        }
    }
    
    override func tearDown() {
        super.tearDown()
        coreDataManager = nil
        dayList = []
        bag = []
    }
}
