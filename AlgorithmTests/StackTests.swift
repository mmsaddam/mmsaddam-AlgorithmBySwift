//
//  StackTests.swift
//  AlgorithmTests
//
//  Created by Muzahidul Islam on 14/4/20.
//  Copyright © 2020 Muzahid. All rights reserved.
//

import XCTest
@testable import Algorithm

class StackTests: XCTestCase {
    private var stack = Stack<Int>()
    
    func testPush() {
        (1...10).forEach { stack.push($0) }
        XCTAssertEqual(stack.count, 10)
        XCTAssertEqual(try? stack.peek(), 10)
    }
    
    func testPop() {
        (1...10).forEach { stack.push($0) }
         _ = try? stack.pop()
        _ = try? stack.pop()
        _ = try? stack.pop()
        XCTAssertEqual(stack.count, 7)
        XCTAssertEqual(try? stack.peek(), 7)
    }
    
    func testEmpty() {
        (1...10).forEach { stack.push($0) }
        XCTAssertEqual(try? stack.peek(), 10)
        
        stack.clear()
        
        XCTAssertThrowsError(try stack.peek()) { error in
            XCTAssertEqual(error as! Stack<Int>.StackError, .empty)
        }

    }

    func testEnumaration() {
        (1...10).forEach { stack.push($0) }
        stack.enumarated { value in
            XCTAssertNotNil(value)
        }
    }
    
    override func tearDown() {
        stack.clear()
    }
}

