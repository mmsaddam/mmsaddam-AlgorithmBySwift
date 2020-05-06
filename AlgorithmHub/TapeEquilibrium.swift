//
//  TapeEquilibrium.swift
//  AlgorithmHub
//
//  Created by Muzahidul Islam on 6/5/20.
//  Copyright © 2020 Muzahid. All rights reserved.
//

import Foundation

/**
  Find min difference between two slices
 */

func tapeEquilibrium(_ A: [Int]) -> Int {
    var prefixSum = [Int](repeating: 0, count: A.count + 1)
    
    for i in 0..<A.count {
        prefixSum[i+1] = A[i] +  prefixSum[i]
    }
    var min = Int.max
    
    let maxSum = prefixSum[prefixSum.count - 1]
    
    for i in 1..<prefixSum.count {
       let dif = abs(prefixSum[i] - (maxSum - prefixSum[i]))
        if dif < min {
            min = dif
        }
    }
    return min
}

