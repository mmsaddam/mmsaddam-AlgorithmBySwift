//
//  QueueTests.swift
//  AlgorithmTests
//
//  Created by Muzahidul Islam on 16/4/20.
//  Copyright © 2020 Muzahid. All rights reserved.
//

import XCTest
@testable import Algorithm

class QueueTests: XCTestCase {
    private var queue: Queue<String>?
    
    override func setUp() {
        queue = Queue<String>()
    }
    
    func testEnqueueDequeue() {
        (1...10).map { String($0) }.forEach { queue?.enqueue($0) }
        /// <- [1,2,3,4,5,6,7,8,9,10] 
        XCTAssertEqual(queue?.count, 10)
        XCTAssertEqual(try? queue?.peek(), "1")
        XCTAssertEqual(try? queue?.dequeue(), "1")
        XCTAssertEqual(try? queue?.dequeue(), "2")
        
        XCTAssertEqual(try? queue?.peek(), "3")
        
        queue?.enqueue("1")
        queue?.enqueue("2")
        
        XCTAssertEqual(queue?.count, 10)
        
        (1...10).forEach { _ in  _ = try? queue?.dequeue() }
        
        XCTAssertThrowsError(try queue?.peek(), "Queue is empty") { (error) in
            XCTAssertNotNil(error)
        }
        
    }
    
    func testPriorityQueue() {
        var pQueue = PriorityQueue<Int>()
        XCTAssertThrowsError(try pQueue.peek(), "Queue is empty") { (error) in
            XCTAssertNotNil(error)
        }
        
        
        pQueue.enqueue(30)
        pQueue.enqueue(40)
        pQueue.enqueue(20)

        XCTAssertEqual(pQueue.count, 3)
        XCTAssertEqual(try? pQueue.peek(), 40, "Highest priority item should be in front")
        _ = try? pQueue.dequeue()
        XCTAssertEqual(try? pQueue.peek(), 30, "Highest priority item should be in front")
        
    }
    
    override func tearDown() {
        queue?.clear()
    }
    
    
}
