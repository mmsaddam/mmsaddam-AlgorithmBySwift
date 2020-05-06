//
//  FindDistinctCount.swift
//  AlgorithmHub
//
//  Created by Muzahidul Islam on 6/5/20.
//  Copyright © 2020 Muzahid. All rights reserved.
//

import Foundation

/**
 Compute number of distinct values in an array.
 */

func findDistinct(_ A: [Int]) -> Int {
    var map: [Int : Int] = [:]
    var count = 0
    for i in A {
        if map[i] == nil {
            map[i] = i
            count += 1
        }
    }
    return count
}

func findDistinct2(_ A: [Int]) -> Int {
    let sA = A.sorted()
    var count = 0
    var i = 0
    while i < sA.count {
        while i < sA.count - 1 && sA[i] == sA[i+1] {
            i += 1
        }
        print(i)
        i += 1
        count += 1
    }
    return count
}
