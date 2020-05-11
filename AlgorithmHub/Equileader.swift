//
//  Equileader.swift
//  AlgorithmHub
//
//  Created by Muzahidul Islam on 11/5/20.
//  Copyright © 2020 Muzahid. All rights reserved.
//

import Foundation

class Equileader {
    class func solution(_ A: inout [Int]) -> Int {
        guard A.count > 0 else { return 0 }
        if A.count == 2 {
            return A[0] == A[1] ? 1 : 0
        }
        var count = 0
        for i in 0..<A.count - 1 {
            let el1 = getEquileader(Array(A[..<i]))
            let el2 = getEquileader(Array(A[i...]))
            
            if el1 == el2 && el1 != -1 {
               count += 1
            }
        }
        return count
    }
    
   fileprivate class func getEquileader(_ a: [Int]) -> Int {
        var map: [Int : Int] = [ : ]
        for e in a {
            let count = map[e] ?? 0
            map[e] = count + 1
            if count + 1 > a.count / 2 {
                return e
            }
        }
        return -1
    }
    
}
