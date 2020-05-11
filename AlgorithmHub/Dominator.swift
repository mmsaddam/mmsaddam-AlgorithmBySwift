//
//  Dominator.swift
//  AlgorithmHub
//
//  Created by Muzahidul Islam on 10/5/20.
//  Copyright © 2020 Muzahid. All rights reserved.
//

import Foundation
/**
 Find an index of an array such that its value occurs at more than half of indices in the array.
 */
class Dominator {
    class func  solution(_ A : inout [Int]) -> Int {
//        guard A.count > 1 else { return -1 }
        var map: [Int : Int] = [:]
        for (i,e) in A.enumerated() {
            let count = map[e] ?? 0
            map[e] = count + 1
            if count + 1 > A.count / 2 {
                return i
            }
        }
        return -1
    }
    
    class func  solution1(_ A : inout [Int]) -> Int {
        guard A.count > 1 else { return -1 }
        
        let sortedA = A.sorted()
        var flag = A[0]
        var dominator: Int?
        var count = 0
        for e in sortedA {
            if flag == e {
                count += 1
                if count > A.count / 2{
                    dominator = e
                    break
                }
            } else {
                flag = e
                count = 1
            }
        }
        if let d = dominator {
            for (i, e) in A.enumerated() {
                if e == d {
                    return i
                }
            }
        }
        return -1
    }
    
}
