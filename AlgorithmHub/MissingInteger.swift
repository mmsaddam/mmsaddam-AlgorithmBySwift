//
//  MissingInteger.swift
//  AlgorithmHub
//
//  Created by Muzahidul Islam on 2/5/20.
//  Copyright © 2020 Muzahid. All rights reserved.
//

import Foundation
/**
 Find the smallest positive integer that does not occur in a given sequence.
 For example, given A = [1, 3, 6, 4, 1, 2], the function should return 5.
 */
func missingIntegerSolution(_ A: [Int]) -> Int {
    var hashMap: [Int : Bool] = [:]
    for e in A {
        hashMap[e] = true
    }
    
    var i = 1
    
    while (hashMap[i] == true) {
        i += 1
    }
    
    return i
}


