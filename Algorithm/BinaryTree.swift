//
//  BinaryTree.swift
//  Algorithm
//
//  Created by Muzahidul Islam on 19/4/20.
//  Copyright © 2020 Muzahid. All rights reserved.
//

import Foundation

public struct BinaryTree<T: Comparable> {
    
    public class Node<T: Comparable>: Equatable {
        var value: T
        var left: Node<T>?
        var right: Node<T>?
        
        init(_ value: T) {
            self.value = value
        }
        
        public static func == (lhs: Node, rhs: Node) -> Bool {
            return lhs.value == rhs.value
        }
    }
    
    public var root: Node<T>?
    public var count: Int = 0
    
    public mutating  func add(_ value: T) {
        if root == nil {
            root = Node(value)
        } else {
            addNode(root!, value: value)
        }
        count += 1
    }
    
    private func addNode(_ current: Node<T>, value: T) {
        if value >= current.value {
            if current.right == nil {
                current.right = Node(value)
            } else {
                addNode(current.right!, value: value)
            }
            
        } else {
            if current.left == nil {
                current.left = Node(value)
            } else {
                addNode(current.left!, value: value)
            }
        }
    }
    
    private func findWithParent(_ value: T, parent: inout Node<T>?) -> Node<T>? {
          var current = root
          parent = nil
          
          while current != nil {
              if current!.value > value {
                  parent = current
                  current = current?.left
              } else if current!.value < value {
                  parent = current
                  current = current?.right
              } else {
                  break
              }
          }
          return current
      }
    
    
    /// Pre-oder traversal
    
    public func preOrderTraversal(_ closure: @escaping (T) -> Void) {
        preOrderTraversal(root, closure: closure)
    }
    
    private func preOrderTraversal(_ parent: Node<T>?,  closure: @escaping (T) -> Void) {
        if parent != nil {
            closure(parent!.value)
            preOrderTraversal(parent?.left, closure: closure)
            preOrderTraversal(parent?.right, closure: closure)
        }
    }
    
    public func inOrderTraversal(_ closure: @escaping (T) -> Void ) {
        inOrderTraversal(root, closure: closure)
    }
    
    private func inOrderTraversal(_ parent: Node<T>?,  closure: @escaping (T) -> Void) {
        if parent != nil {
            inOrderTraversal(parent?.left, closure: closure)
            closure(parent!.value)
            inOrderTraversal(parent?.right, closure: closure)
        }
    }
    
    public func postOrderTraversal(_ closure: @escaping (T) -> Void) {
           postOrderTraversal(root, closure: closure)
       }
       
    private func postOrderTraversal(_ parent: Node<T>?,  closure: @escaping (T) -> Void) {
        if parent != nil {
            postOrderTraversal(parent?.left, closure: closure)
            postOrderTraversal(parent?.right, closure: closure)
            closure(parent!.value)
        }
    }
}
