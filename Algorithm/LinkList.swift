//
//  LinkList.swift
//  Algorithm
//
//  Created by Muzahidul Islam on 13/4/20.
//  Copyright © 2020 Muzahid. All rights reserved.
//

import Foundation

public struct LinkList<T: Comparable> {
    enum LinkListError: String, Error {
        case empty
    }
    
    public class Node<T: Comparable>: Equatable {
        var value: T
        var next: Node<T>?
        
        init(value: T) {
            self.value = value
        }
        
        public static func == (lhs: Node, rhs: Node) -> Bool {
            return lhs.value == rhs.value && lhs.next?.value == rhs.next?.value
        }
    }
   
    
    private(set) var head: Node<T>?
    private(set) var trail: Node<T>?
    
    public var count: Int {
        var c = 0
        var temp = head
        while temp != nil  {
            c += 1
            temp = temp?.next
        }
        return c
    }
    
   public mutating func addLast(_ value: T) {
        defer {
            printList()
        }
        let newNode = Node<T>(value: value)
        if head == nil {
            head = newNode
            trail = newNode
        } else {
            trail?.next = newNode
            trail = newNode
        }
    }
    
   public mutating func addFirst(_ value: T) {
        defer {
            printList()
        }
        let newNode = Node(value: value)
        if head == nil {
            head = newNode
            trail = head
        } else {
            newNode.next = head
            head = newNode
        }
    }
    
    public func nodeAtIndex(_ index: Int) throws -> Node<T>? {
        if head == nil {
            throw LinkListError.empty
        } else if index > count  {
            return trail
        }
        
        var node = head
        var i = 1
        while node != nil && i < index {
            node = node?.next
            i += 1
        }
        
        return node
    }
    
    public mutating func addBefore(_ node: Node<T>, item: T) {
        var current = head
        
        while current != nil && current?.next != node {
            current = current?.next
        }
        
        if current == nil {
            addLast(item)
        } else {
            let newNode = Node(value: item)
            newNode.next = current?.next
            current?.next = newNode
        }
    }
   
    public mutating func addAfter(_ node: Node<T>, item: T) {
           var current = head
           
           while current != nil && current != node {
               current = current?.next
           }
           
           if current == nil {
               addLast(item)
           } else {
               let newNode = Node(value: item)
               newNode.next = current?.next
               current?.next = newNode
           }
       }
    
    
  public mutating func removeFirst() -> T? {
        defer {
            printList()
        }
        if head == nil {
            return nil
        } else {
            let temp = head
            head = head?.next
            return temp?.value
        }
    }
    
   public  mutating func removeLast() -> T? {
        defer {
            printList()
        }
        if head == nil {
            return nil
        } else if head?.next == nil{
            let tmp = head
            head = nil
            trail = nil
            return tmp?.value
        } else {
            var successorOfTrail = head
            
            while !(successorOfTrail?.next === trail) {
                successorOfTrail = successorOfTrail?.next
            }
            let val = trail?.value
            successorOfTrail?.next = nil
            trail = successorOfTrail
            return val
        }
        
    }
    
   public func enumarated(_ closure: (T) -> Void ) {
        var node = head
        while node != nil {
            closure(node!.value)
            node = node?.next
        }
    }
    
    public mutating func clear() {
        head = nil
        trail = nil
    }
    
    func printList() {
        print(description)
    }
    
}

extension LinkList {
    public func filter(_ predicate: (T) -> Bool ) -> LinkList {
        var newList = LinkList<T>()
        var node = head
        while node != nil {
            let value = node!.value
            let isTrue = predicate(value)
            if isTrue {
                newList.addLast(value)
            }
            node = node?.next
        }
        return newList
    }
 
    public func map<U>(_ closure: (T) -> U ) -> LinkList<U> {
        var newList : LinkList<U> = LinkList<U>()
        var node = head
        while node != nil {
            let newValue = closure(node!.value)
            newList.addLast(newValue)
            node = node?.next
        }
        return newList
        
    }
    
}


extension LinkList: CustomStringConvertible {
    public var description: String {
        var s = "["
        var node = head
        while node != nil {
            s += "\(node!.value)"
            node = node?.next
            if node != nil {
                s += ","
            }
        }
        s += "]"
        return s
    }
}
