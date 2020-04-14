//
//  HashMap.swift
//  Algorithm
//
//  Created by Muzahidul Islam on 13/4/20.
//  Copyright © 2020 Muzahid. All rights reserved.
//

import Foundation

//func djb2Hash(_ string: String) -> Int {
//    let unicodeScalars = string.unicodeScalars.map { $0.value }
//    return unicodeScalars.reduce(5381) {
//        ($0 << 5) &+ $0 &+ Int($1)
//    }
//}


public class HashMap<Key: Hashable, Value> {
    typealias Element = (Key: Key, Value: Value)
    typealias Bucket = [Element]
    
    private(set) var buckets: [Bucket]
    private(set) var count = 0
    
    init(_ capacity: Int) {
        assert( capacity > 0 )
        buckets = Array<Bucket>(repeating: [] , count: capacity)
    }
    
    private func indexFor(key: Key) -> Int {
        let hashValue = key.hashValue
        let index = abs(hashValue) % buckets.count
        return index
    }
    
   private func valueFor(key: Key) -> Value? {
        let index = indexFor(key: key)
        return buckets[index].first { $0.Key == key }?.Value
    }
    
    private func update(_ value: Value, for key: Key) {
        let index = indexFor(key: key)
        if let (i, _ ) = buckets[index].enumerated().first(where: { $0.1.Key == key }) {
            buckets[index][i].Value = value
        } else {
            buckets[index].append((Key: key, Value: value))
            count += 1
        }
        
    }
    
   private func removeValue(for key: Key) {
        let index = indexFor(key: key)
        if let (i, _ ) = buckets[index].enumerated().first(where: { $0.1.Key == key }) {
            buckets[index].remove(at: i)
            count -= 1
        }
    }
    
}

extension HashMap {
    public subscript(key: Key) -> Value? {
        get {
            return valueFor(key: key)
        }
        set {
            if let value = newValue {
                update(value, for: key)
            } else {
                removeValue(for: key)
            }
        }
    }
}
