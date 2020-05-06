//
//  MinAvgTwoSlice.swift
//  AlgorithmHub
//
//  Created by Muzahidul Islam on 5/5/20.
//  Copyright © 2020 Muzahid. All rights reserved.
//

import Foundation

/**
 Find the minimal average of any slice containing at least two elements.
 For example, array A such that:
 
 A[0] = 4
 A[1] = 2
 A[2] = 2
 A[3] = 5
 A[4] = 1
 A[5] = 5
 A[6] = 8
 contains the following example slices:
 
 slice (1, 2), whose average is (2 + 2) / 2 = 2;
 slice (3, 4), whose average is (5 + 1) / 2 = 3;
 slice (1, 4), whose average is (2 + 2 + 5 + 1) / 4 = 2.5.
 The function should return 1, as explained above.
 */

func minAvgTwoSlice(_ A: [Int])  -> Int {
      //main idea: will find min average by checking only 2 and 3 contiguous elements at a time

    var minAvg: Double = Double((A[0] + A[1])) / 2.0
    var minAvgIndex = 0
    for i in 0..<A.count-2 {
        let twoSliceAvg = Double(A[i] + A[i+1]) / 2.0
        if minAvg > twoSliceAvg {
            minAvg = twoSliceAvg
            minAvgIndex = i
        }
        let threeSliceAvg = Double(A[i] + A[i+1] + A[i+2]) / 2.0
        if minAvg > threeSliceAvg {
            minAvg = threeSliceAvg
            minAvgIndex = i
        }
        
    }
    /// check two slice for last two
    if minAvg > Double(A[A.count-1] + A[A.count-2])/2.0 {
        minAvgIndex = A.count - 1
    }
    
    return minAvgIndex
    
}
