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
    
    public func contain(_ value: T) -> Bool {
        var parent: Node<T>?
        let node = findWithParent(value, parent: &parent)
        return node != nil
    }
    
    public mutating func remove(_ value: T) -> Bool {
        var parent: Node<T>?
        var current: Node<T>?
        current = findWithParent(value, parent: &parent)
        if current == nil {
            /// does not exist node
            return false
        }
        count -= 1
        
        /// Case 1: If current has no right child, replace current's left with current
        if current?.right == nil {
            if parent == nil {
                /// Head to remove
                root = current?.left
            } else {
                if parent!.value > current!.value {
                    parent?.left = current?.left
                } else {
                    parent?.right = current?.left
                }
            }
        }
            /**
             Case 2: If current right has no left child, replace current's right with current
             */
        else if current?.right?.left == nil {
            current?.right?.left = current?.left
            if parent == nil {
                root = current?.right
            } else {
                if parent!.value > current!.value {
                    parent?.left = current?.right
                } else {
                    parent?.right = current?.right
                }
            }
        }
            /**
             Case 3: If current right has a left child, then replace the current with current's right child's left most child
             */
        else {
            /// Find the right left most child
            var leftMost = current?.right?.left
            var leftMostParent = current?.right
            
            while leftMost?.left != nil {
                leftMostParent = leftMost
                leftMost = leftMost?.left
            }
            
            /// parent's left subtree become the leftmost's right subtree
            leftMostParent?.left = leftMost?.right
            
            // assign left most right and left to current's left and right
            leftMost?.left = current?.left
            leftMost?.right = current?.right
            
            if parent == nil {
                root = leftMost
            } else {
                /// if parent grater than current value
                /// make left most child the parent's left
                if parent!.value > current!.value {
                    parent?.left = leftMost
                } else {
                    parent?.right = leftMost
                }
            }
        }
        
        return true
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
