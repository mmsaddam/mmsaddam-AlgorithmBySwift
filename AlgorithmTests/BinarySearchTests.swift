//
//  BinarySearchTests.swift
//  AlgorithmTests
//
//  Created by Muzahidul Islam on 19/4/20.
//  Copyright © 2020 Muzahid. All rights reserved.
//

import XCTest
@testable import Algorithm

class BinarySearchTests: XCTestCase {
    var tree: BinaryTree<Int>?
    
    override func setUp() {
        tree = BinaryTree<Int>()
    }
    
    func testAddNode() {
        XCTAssertNil(tree?.root)
        tree?.add(4)
        XCTAssertNotNil(tree?.root)
        XCTAssertEqual(tree?.count, 1)
        tree?.add(6)
        tree?.add(3)
        XCTAssertEqual(tree?.count, 3)
        
        print("Pre-Order")
        tree?.preOrderTraversal({ (value) in
            print(value)
            XCTAssertNotNil(value)
        })
        
        print("In-Order")
        tree?.inOrderTraversal({ (value) in
            print(value)
            XCTAssertNotNil(value)
        })
        
        print("Post-Order")
        tree?.postOrderTraversal({ (value) in
            print(value)
            XCTAssertNotNil(value)
        })
        
        
    }
    
}
