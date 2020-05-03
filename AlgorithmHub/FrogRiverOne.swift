//
//  FrogRiverOne.swift
//  AlgorithmHub
//
//  Created by Muzahidul Islam on 2/5/20.
//  Copyright © 2020 Muzahid. All rights reserved.
//

import Foundation

/**
     Find the earliest time when a frog can jump to the other side of a river.
     For example, you are given integer X = 5 and array A such that:
     A[0] = 1
     A[1] = 3
     A[2] = 1
     A[3] = 4
     A[4] = 2
     A[5] = 3
     A[6] = 5
     A[7] = 4
     In second 6, a leaf falls into position 5. This is the earliest time when leaves appear in every position across the river.
 */

func frogRiverOneSolution( _ X: Int, A: [Int]) -> Int {
    
    var hashMap: [Int: Bool] = [:]
    
    for (i, e) in A.enumerated() {
        hashMap[e] = true
        if hashMap.count == X {
            return i
        }
    }
    
    return -1
}
