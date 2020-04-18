//
//  Queue.swift
//  Algorithm
//
//  Created by Muzahidul Islam on 16/4/20.
//  Copyright © 2020 Muzahid. All rights reserved.
//

import Foundation
extension String: Error { }

public struct Queue<T: Comparable> {
    private var list: LinkList<T>
    
    public init() {
        list = LinkList<T>()
    }
    
    public var count: Int {
        list.count
    }
    
    public mutating func enqueue(_ item: T) {
        list.addLast(item)
    }
    
    public mutating func dequeue() throws -> T? {
        if list.count == 0 {
            throw "Queue is empty"
        } else {
            return list.removeFirst()
        }
    }
    
    public func peek() throws -> T? {
        if list.count == 0 {
            throw "Queue is empty"
        } else {
            return list.head?.value
        }
    }
    
    public mutating func clear() {
        list.clear()
    }
    
    public func enumarated(_ closure: (T) -> Void) {
        list.enumarated(closure)
    }
}

public struct PriorityQueue<T: Comparable> {
    private var list: LinkList<T>
    
    public init() {
        list = LinkList<T>()
    }
    
    public var count: Int {
        list.count
    }
    
    /// Add new item into queue as priority basis
    /// Higher priority item inserted more front side of the queue
    public mutating func enqueue(_ item: T) {
        if count == 0 {
            list.addLast(item)
        } else {
            var node = list.head
            
            while node != nil && node!.value > item {
                node = node?.next
            }
            if node == nil {
                list.addLast(item)
            } else {
                list.addBefore(node!, item: item)
            }
        }
        print(#function)
    }
    
    /// Returns the highes priority item from the queue
    public mutating func dequeue() throws -> T? {
        if count == 0 {
            throw "Queue is empty"
        } else {
            return list.removeFirst()
        }
    }
    
    /// Return the most front item from the queue
    public func peek() throws -> T? {
        if list.count == 0 {
            throw "Queue is empty"
        } else {
            return list.head?.value
        }
    }
    
}
