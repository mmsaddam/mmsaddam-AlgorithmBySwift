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
    
    enum Travese {
        case inOrder
        case preOrder
        case postOrder
    }
    
    func testContainNode() {
        var bTree = BinaryTree<String>()
        loadTree(nodes: ["4", "2", "1", "3", "6", "5", "7"], tree: &bTree)
        XCTAssertTrue(bTree.contain("4"))
        XCTAssertTrue(!bTree.contain("8")) // 8 does not exist
        XCTAssertTrue(bTree.contain("7"))
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
    
    func testAddMultipleNodes() {
          /**
                              4
                      2               6
                  1       3       5       7
           
           
           */
          
          var bTree = BinaryTree<String>()
          loadTree(nodes: ["4", "2", "1", "3", "6", "5", "7"], tree: &bTree)
          
          XCTAssertEqual(bTree.count, 7)
          var inOrderStr = ""
          bTree.inOrderTraversal { inOrderStr += $0 }
          XCTAssertEqual(inOrderStr, "1234567")
          
          var preOrderStr = ""
          bTree.preOrderTraversal { preOrderStr += $0 }
          XCTAssertEqual(preOrderStr, "4213657")
          
          var postOrderStr = ""
          bTree.postOrderTraversal { postOrderStr += $0 }
          XCTAssertEqual(postOrderStr, "1325764")
      
      }
    
    /// Case 1: If removing node has no right child
    func testRemoveNodeCase1() {
       var tree = BinaryTree<Int>()
        loadTree(nodes: [4, 2 , 1, 3, 6, 5, 7], tree: &tree)
        XCTAssertEqual(tree.count, 7)
        
        XCTAssertTrue(tree.remove(3))
        XCTAssertTrue(tree.remove(1))
        XCTAssertEqual(tree.count, 5)
        
        var traverseString = ""
        
        tree.inOrderTraversal { traverseString += String($0) }
        XCTAssertEqual(traverseString, "24567")
        
        traverseString = ""
        tree.preOrderTraversal { traverseString += String($0) }
        XCTAssertEqual(traverseString, "42657")
        
        traverseString = ""
        tree.postOrderTraversal { traverseString += String($0) }
        XCTAssertEqual(traverseString, "25764")
        
        traverseString = ""
        XCTAssertTrue(tree.remove(5))
        tree.inOrderTraversal { traverseString += String($0) }
        XCTAssertEqual(traverseString, "2467")
        
        traverseString = ""
        XCTAssertTrue(tree.remove(7))
        tree.inOrderTraversal { traverseString += String($0) }
        XCTAssertEqual(traverseString, "246")
        
        traverseString = ""
        tree.preOrderTraversal { traverseString += String($0) }
        XCTAssertEqual(traverseString, "426")
        
        traverseString = ""
        tree.postOrderTraversal { traverseString += String($0) }
        XCTAssertEqual(traverseString, "264")

    }
    
    /// If removing nodes right child has no left child.
    /// Then replace the current's right child with current.
    func testRemoveNodeCase2() {
         /**
                             4
                     2               6
                 1       3       5       7
                                            8
                  
            */
        var tree = BinaryTree<Int>()
        loadTree(nodes: [4,2,1,3,6,5,7,8], tree: &tree)
        
        XCTAssertEqual(tree.count, 8)
        
        var result = ""
        
        tree.inOrderTraversal { result += String($0) }
        XCTAssertEqual(result, "12345678")
        
        result = ""
        tree.preOrderTraversal { result += String($0) }
        XCTAssertEqual(result, "42136578")
        
        result = ""
        tree.postOrderTraversal { result += String($0) }
        XCTAssertEqual(result, "13258764")
        
       /// Node deletion
        let isDeleted = tree.remove(6)
        
        /**
                            4
                    2               7
                1       3       5       8
                                           
                 
           */
        
        
        XCTAssertTrue(isDeleted)
        XCTAssertEqual(tree.count, 7)

        result = ""
        tree.inOrderTraversal { result += String($0) }
        XCTAssertEqual(result, "1234578")

        result = ""
        tree.preOrderTraversal { result += String($0) }
        XCTAssertEqual(result, "4213758")

        result = ""
        tree.postOrderTraversal { result += String($0) }
        XCTAssertEqual(result, "1325874")
   
    }
    
    /// If removing node's right child has a left child.
    /// Then replace the removing node's right child's leftmost child with removing noode.
    
    func testRemoveNodeCase3() {
        
        /**
                    4
            2                 6
        1       3       5           8
                                7
         
         */
        var tree = BinaryTree<Int>()
        loadTree(nodes: [4,2,1,3,6,5,8,7], tree: &tree)
        
        XCTAssertEqual(tree.count, 8)
        
        var result = ""
        
        tree.inOrderTraversal { result += String($0) }
        XCTAssertEqual(result, "12345678")
        
        result = ""
        tree.preOrderTraversal { result += String($0) }
        XCTAssertEqual(result, "42136587")
        
        result = ""
        tree.postOrderTraversal { result += String($0) }
        XCTAssertEqual(result, "13257864")
        
        /// Node deletion
        let isDeleted = tree.remove(6)
        
        /**
                        4
                2               7
            1       3       5       8
         
         
         */
        
        
        XCTAssertTrue(isDeleted)
        XCTAssertEqual(tree.count, 7)
        
        result = ""
        tree.inOrderTraversal { result += String($0) }
        XCTAssertEqual(result, "1234578")
        
        result = ""
        tree.preOrderTraversal { result += String($0) }
        XCTAssertEqual(result, "4213758")
        
        result = ""
        tree.postOrderTraversal { result += String($0) }
        XCTAssertEqual(result, "1325874")
        
    }
   
    private func loadTree<T: Comparable>(nodes: [T], tree: inout BinaryTree<T> ) {
        nodes.forEach { tree.add($0) }
    }
    
}
