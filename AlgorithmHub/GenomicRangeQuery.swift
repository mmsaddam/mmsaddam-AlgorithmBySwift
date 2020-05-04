//
//  GenomicRangeQuery.swift
//  AlgorithmHub
//
//  Created by Muzahidul Islam on 4/5/20.
//  Copyright © 2020 Muzahid. All rights reserved.
//

import Foundation
/**
 Find the minimal nucleotide from a range of sequence DNA.
 For example, given the string S = CAGCCTA and arrays P, Q such that:
     P[0] = 2    Q[0] = 4
     P[1] = 5    Q[1] = 5
     P[2] = 0    Q[2] = 6
 the function should return the values [2, 4, 1], as explained above.

 Write an efficient algorithm for the following assumptions:

 N is an integer within the range [1..100,000];
 M is an integer within the range [1..50,000];
 each element of arrays P, Q is an integer within the range [0..N − 1];
 P[K] ≤ Q[K], where 0 ≤ K < M;
 string S consists only of upper-case English letters A, C, G, T.
 */

/**
    Complexity O(N * M)
 */
func genomRangeQuerySolution1(_ S: String, P: [Int], Q: [Int]) -> [Int] {
    var hasMap: [Character : Int] = [:]
    for (i, e) in "ACGT".enumerated() {
        hasMap[e] = i + 1
    }
    
    var result: [Int] = []
    
    for i in 0..<P.count {
        let fromIndex = S.index(S.startIndex, offsetBy: P[i])
        let toIndex = S.index(S.startIndex, offsetBy: Q[i])
        let subStr = String(S[fromIndex...toIndex])
        
        var min = hasMap[subStr.first!]!
        for e in subStr {
            if min > hasMap[e]! {
                min = hasMap[e]!
            }
        }
        result.append(min)
    }
    
    return result
}


/**
    Complexity O(N+M)
 */

func genomicRangeQuery(_ S: String, P: [Int], Q: [Int]) -> [Int] {
  
    var prefixSum = [[Int]](repeating: [Int](repeating: 0, count: S.count + 1), count: 3)
    
    var a = 0, c = 0, g = 0
    
    for (i, e) in S.enumerated() {
        a = 0; c = 0; g = 0
        switch e {
        case "A": a = 1
        case "C": c = 1
        case "G": g = 1
        default:
            a = 0; c = 0; g = 0
        }
        prefixSum[0][i+1] = prefixSum[0][i] + a
        prefixSum[1][i+1] = prefixSum[1][i] + c
        prefixSum[2][i+1] = prefixSum[2][i] + g
    }
    
    var result: [Int] = []
    
    for i in 0..<P.count {
        let start = P[i]
        let end = Q[i] + 1
        if prefixSum[0][end] - prefixSum[0][start] > 0 {
            result.append(1)
        } else if prefixSum[1][end] - prefixSum[1][start] > 0 {
            result.append(2)
        } else if prefixSum[2][end] - prefixSum[2][start] > 0 {
            result.append(3)
        } else {
            result.append(4)
        }
        
    }
    
    return result
}

