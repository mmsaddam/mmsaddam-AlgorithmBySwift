//
//  Equileader.swift
//  AlgorithmHub
//
//  Created by Muzahidul Islam on 11/5/20.
//  Copyright © 2020 Muzahid. All rights reserved.
//

import Foundation

/**
 Find the index S such that the leaders of the sequences A[0], A[1], ..., A[S] and A[S + 1], A[S + 2], ..., A[N - 1] are the same.
 For example, given array A such that:

     A[0] = 4
     A[1] = 3
     A[2] = 4
     A[3] = 4
     A[4] = 4
     A[5] = 2
 we can find two equi leaders:

 0, because sequences: (4) and (3, 4, 4, 4, 2) have the same leader, whose value is 4.
 2, because sequences: (4, 3, 4) and (4, 4, 2) have the same leader, whose value is 4.
 */

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
    
    class func solution1(_ A: inout [Int]) -> Int {
        var flag = 0
        var candidate: Int?
        for i in A {
            if flag == 0 {
                candidate = i
            }
            if (candidate == i) == true {
                flag += 1
            } else {
                flag -= 1
            }
        }
        
        if flag == 0 {
            return 0
        }
        var count = 0
        for i in A {
            if (i == candidate) == true {
                count += 1
            }
        }
        
        if count < A.count / 2 {
            return 0
        }
        
        var lCont = 0
        var eCount = 0
        
        for (i, e) in A.enumerated() {
            if (e == candidate) == true {
                lCont += 1
            }
            let leftE = lCont > (i+1) / 2
            let rightE =  (count - lCont) > (A.count - (i+1)) / 2
            if leftE && rightE  {
                eCount += 1
            }
        }
        
        return eCount
    }
         
    
}
