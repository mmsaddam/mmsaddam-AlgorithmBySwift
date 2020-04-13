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


