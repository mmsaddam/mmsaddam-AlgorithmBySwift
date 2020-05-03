//
//  CountDiv.swift
//  AlgorithmHub
//
//  Created by Muzahidul Islam on 3/5/20.
//  Copyright © 2020 Muzahid. All rights reserved.
//

import Foundation
/**
 Compute number of integers divisible by k in range [a..b].
 */

func countDiv(_ A: Int, B: Int, K : Int) -> Int {
    if A == B {
        return A / K
    }
    
    var firstDividable: Int
    if A % K == 0 {
        firstDividable = A
    } else {
        firstDividable = A + (K - (A % K))
    }
    let secondDividable = B - (B % K )
    let result = (secondDividable - firstDividable) / K + 1
    return result
}
