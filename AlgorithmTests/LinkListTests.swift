//
//  LinkListTests.swift
//  AlgorithmTests
//
//  Created by Muzahidul Islam on 13/4/20.
//  Copyright © 2020 Muzahid. All rights reserved.
//

import XCTest
@testable import Algorithm

class LinkListTests: XCTestCase {
    var list: LinkList<Int>?
    
    override func setUp() {
        list = LinkList<Int>()
    }
    
    func testAddFirst() {
        list?.addFirst(1)
        XCTAssertEqual(list?.head?.value, 1)
    }

    func testAddLast() {
        list?.addLast(2)
        XCTAssertEqual(list?.trail?.value, 2)
    }
    
    func testRemoveFirst() {
        for i in 1...5 {
            list?.addFirst(i)
        }
        
        let head = list?.head
        let first = list?.removeFirst()
        XCTAssertEqual(head?.value, first)
    }
    
    func testRemoveLast() {
        for i in 1...3 {
            list?.addLast(i)
        }
        
        let trail = list?.trail
        let last = list?.removeLast()
        XCTAssertEqual(trail?.value, last)
    }
    
    func testAddBefore() {
        list?.addFirst(1)
        list?.addLast(2)
        list?.addLast(4)
        list?.addLast(5)
        
        //// Add new node before index 3
        if let node = try? list?.nodeAtIndex(3) {
            list?.addBefore(node, item: 3)
            XCTAssertEqual(list?.count, 5)
            XCTAssertEqual(try? list?.nodeAtIndex(3)?.value, 3)
            XCTAssertEqual(try? list?.nodeAtIndex(4)?.value, 4)
            
        } else {
            XCTFail("Could not find node at index 3")
        }
        
    }
    
    func testAddAfter() {
        list?.addFirst(1)
        list?.addLast(2)
        list?.addLast(4)
        list?.addLast(5)
        
        //// Add new node after index 2
        if let node = try? list?.nodeAtIndex(2) {
            list?.addAfter(node, item: 3)
            XCTAssertEqual(list?.count, 5)
            XCTAssertEqual(try? list?.nodeAtIndex(3)?.value, 3)
            XCTAssertEqual(try? list?.nodeAtIndex(4)?.value, 4)
            
        } else {
            XCTFail("Could not find node at index 3")
        }
        
    }
    
    func testNodeAtIndex() {
        XCTAssertThrowsError(try list?.nodeAtIndex(0)) { error in
            XCTAssertNotNil(error)
        }
        list?.addFirst(1)
        list?.addLast(2)
        list?.addLast(3)
        list?.addLast(4)
        list?.addLast(5)
        
        let firstNode = try? list?.nodeAtIndex(1)
        XCTAssertEqual(firstNode?.value, 1, "Value should be equal")
        
        let thirdNode = try? list?.nodeAtIndex(4)
        XCTAssertEqual(thirdNode?.value, 4, "Value should be equal")
        
        _ = list?.removeLast()
        
        let lastNode = try? list?.nodeAtIndex(5)
        
        XCTAssertEqual(lastNode?.value, 4, "Value should be equal")
        
    }
    
    func testCount() {
        list?.addFirst(1)
        list?.addFirst(2)
        list?.addFirst(3)
        XCTAssertEqual(list?.count, 3)
    }
    
    func testFilter() {
        for i in 1...10 {
            list?.addLast(i)
        }
        
        let filteredList = list?.filter({ (value) -> Bool in
            return value % 2 == 0
        })
        
        var isAllEven = true
        filteredList?.enumarated({ (value) in
            if value % 2 != 0 {
                isAllEven = false
            }
        })
        
        XCTAssertEqual(isAllEven, true)
        XCTAssertEqual(filteredList?.count, 5)
    }
    
    func testMap() {
        for i in 1...10 {
            list?.addLast(i)
        }
        let newList = list?.map({ $0 * $0 })
        XCTAssertEqual(newList?.head?.value, 1)
        XCTAssertEqual(newList?.trail?.value, 100)
    }
    
    
    override func tearDown() {
        list = nil
    }

    func testPerformanceExample() {
        // This is an example of a performance test case.
        self.measure {
            // Put the code you want to measure the time of here.
        }
    }

}


