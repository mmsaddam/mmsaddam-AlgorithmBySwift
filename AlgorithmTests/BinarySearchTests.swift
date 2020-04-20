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
    
    func testAddMultipleNodes() {
        /**
                            4
                    2               6
                1       3       5       7
         
         
         */
        
        var sTree = BinaryTree<String>()
        loadTree(nodes: ["4", "2", "1", "3", "6", "5", "7"], tree: &sTree)
        
        XCTAssertEqual(sTree.count, 7)
        var inOrderStr = ""
        sTree.inOrderTraversal { inOrderStr += $0 }
        XCTAssertEqual(inOrderStr, "1234567")
        
        var preOrderStr = ""
        sTree.preOrderTraversal { preOrderStr += $0 }
        XCTAssertEqual(preOrderStr, "4213657")
        
        var postOrderStr = ""
        sTree.postOrderTraversal { postOrderStr += $0 }
        XCTAssertEqual(postOrderStr, "1325764")
    
    }
    
    func testTreeWithSingleNode() {
        var tree = BinaryTree<Int>()
        loadTree(nodes: [4], tree: &tree)
        XCTAssertNotNil(tree.root)
        XCTAssertEqual(tree.count, 1)
        var inOrder = ""
        tree.inOrderTraversal { inOrder += "\($0)" }
        XCTAssertEqual("4", inOrder)
        var preOrder = ""
        tree.preOrderTraversal { preOrder += "\($0)" }
        XCTAssertEqual("4", preOrder)
        var postOrder = ""
        tree.postOrderTraversal { postOrder += "\($0)" }
        XCTAssertEqual("4", postOrder)
    }
    
    func testTreeWithTwoNodes() {
        var tree = BinaryTree<Int>()
        /**
                4
                    5
         
         */
        loadTree(nodes: [4, 5], tree: &tree)
        XCTAssertNotNil(tree.root)
        XCTAssertEqual(tree.count, 2)
        var inOrder = ""
        tree.inOrderTraversal { inOrder += "\($0)" }
        XCTAssertEqual("45", inOrder)
        var preOrder = ""
        tree.preOrderTraversal { preOrder += "\($0)" }
        XCTAssertEqual("45", preOrder)
        var postOrder = ""
        tree.postOrderTraversal { postOrder += "\($0)" }
        XCTAssertEqual("54", postOrder)
    }
    
    func testTreeWithThreeNodes() {
        /*
               Demo tree
                   4
               3       6
        */
          var tree = BinaryTree<Int>()
          loadTree(nodes: [4, 3, 6], tree: &tree)
          XCTAssertNotNil(tree.root)
          XCTAssertEqual(tree.count, 3)
          var inOrder = ""
          tree.inOrderTraversal { inOrder += "\($0)" }
          XCTAssertEqual("346", inOrder)
          var preOrder = ""
          tree.preOrderTraversal { preOrder += "\($0)" }
          XCTAssertEqual("436", preOrder)
          var postOrder = ""
          tree.postOrderTraversal { postOrder += "\($0)" }
          XCTAssertEqual("364", postOrder)
      }
    
    private func loadTree<T: Comparable>(nodes: [T], tree: inout BinaryTree<T> ) {
        nodes.forEach { tree.add($0) }
    }
    
}
