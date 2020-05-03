//
//  MaxCounters.swift
//  AlgorithmHub
//
//  Created by Muzahidul Islam on 3/5/20.
//  Copyright © 2020 Muzahid. All rights reserved.
//

import Foundation
/**
 Problem: Calculate the values of counters after applying all alternating operations: increase counter by 1; set value of all counters to current maximum.
 A non-empty array A of M integers is given. This array represents consecutive operations:

 if A[K] = X, such that 1 ≤ X ≤ N, then operation K is increase(X),
 if A[K] = N + 1 then operation K is max counter.
 For example, given integer N = 5 and array A such that:
     A[0] = 3
     A[1] = 4
     A[2] = 4
     A[3] = 6
     A[4] = 1
     A[5] = 4
     A[6] = 4
 the values of the counters after each consecutive operation will be:
     (0, 0, 1, 0, 0)
     (0, 0, 1, 1, 0)
     (0, 0, 1, 2, 0)
     (2, 2, 2, 2, 2)
     (3, 2, 2, 2, 2)
     (3, 2, 2, 3, 2)
     (3, 2, 2, 4, 2)
 The goal is to calculate the value of every counter after all operations.
 */


func maxCountersSolution(_ N: Int, A: [Int]) -> [Int] {
    var result = [Int](repeating: 0, count: N)
    var last_max = 0
    var curr_max = 0
    for  X in A {
        if X > N {
            last_max = curr_max
        } else {
            result[X-1] = max(result[X-1], last_max)
            result[X-1] += 1
            curr_max = max(curr_max, result[X-1])
        }
    }
    for i in 0..<result.count {
        result[i] = max(result[i], last_max)
    }
    return result
}
