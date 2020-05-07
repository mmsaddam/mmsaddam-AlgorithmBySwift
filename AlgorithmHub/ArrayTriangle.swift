//
//  ArrayTriangle.swift
//  AlgorithmHub
//
//  Created by Muzahidul Islam on 7/5/20.
//  Copyright © 2020 Muzahid. All rights reserved.
//

import Foundation
/**
 Determine whether a triangle can be built from a given set of edges.
 An array A consisting of N integers is given. A triplet (P, Q, R) is triangular if 0 ≤ P < Q < R < N and:
 A[P] + A[Q] > A[R],
 A[Q] + A[R] > A[P],
 A[R] + A[P] > A[Q].
 */

func checkTriangle(_ A: [Int]) -> Bool {
    for i in 0..<A.count - 2 {
        for j in i+1..<A.count-1 {
            for k in j+1..<A.count {
                if A[i] + A[j] > A[k] && A[i] + A[k] > A[j] && A[j] + A[k] > A[i] {
                    print(A[i], A[j], A[k])
                    return true
                }
            }
        }
    }
    
    return false
}

func checkTriangle1(_ A: [Int]) -> Bool {
    guard A.count > 2 else { return false }
    let sortedArray = A.sorted(by: <)
    for i in 0..<sortedArray.count - 2 {
        if sortedArray[i] + sortedArray[i+1] > sortedArray[i+2] {
            return true
        }
    }
    return false
}
