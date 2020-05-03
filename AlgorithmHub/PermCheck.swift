//
//  PermCheck.swift
//  AlgorithmHub
//
//  Created by Muzahidul Islam on 3/5/20.
//  Copyright © 2020 Muzahid. All rights reserved.
//

import Foundation
/**
 Check whether array A is a permutation.
 
 For example, array A such that:
     A[0] = 4
     A[1] = 1
     A[2] = 3
     A[3] = 2
 is a permutation, but array A such that:
     A[0] = 4
     A[1] = 1
     A[2] = 3
 is not a permutation, because value 2 is missing.
 */

func permCheckSolution(_ A: [Int]) -> Int {
    let n = A.count
    let expSum = (n*(n+1)) / 2
    
    var hashMap: [Int : Bool] = [:]
    
    var arraySum = 0
    for e in A {
        let exist = hashMap[e] ?? false
        if !exist {
            hashMap[e] = true
            arraySum += e
        }
    }
    
    let result = arraySum == expSum ? 1 : 0
    return result
}
