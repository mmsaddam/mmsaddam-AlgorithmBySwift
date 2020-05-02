//
//  FrogRiverOne.swift
//  AlgorithmHub
//
//  Created by Muzahidul Islam on 2/5/20.
//  Copyright © 2020 Muzahid. All rights reserved.
//

import Foundation

/**
    1. load array with required position
    2. scan every element, check whether it is exist or not. if exist then remove
        check count 0 or not if 0 then return index
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
