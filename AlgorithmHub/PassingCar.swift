//
//  PassingCar.swift
//  AlgorithmHub
//
//  Created by Muzahidul Islam on 6/5/20.
//  Copyright © 2020 Muzahid. All rights reserved.
//

import Foundation

/**
 Count the number of passing cars on the road.
 A[0] = 0
 A[1] = 1
 A[2] = 0
 A[3] = 1
 A[4] = 1
 We have five pairs of passing cars: (0, 1), (0, 3), (0, 4), (2, 3), (2, 4).
 */

func passingCarSolution(_ A: [Int]) -> Int {
    var count = 0
    let flag = A[0]
    for i in 0..<A.count-1 {
        if A[i] == flag {
            for j in i+1..<A.count {
                if A[j] != flag {
                    count += 1
                }
            }

        }
    }
    
    if count > 1000000000 {
        return -1
    }
    
    return count
}

func passingCarSolution2(_ A: [Int]) -> Int {
    var count = 0
    var result = 0
    let flag = A[0]
    for i in 0..<A.count {
        if A[i] == flag {
            count += 1
        } else {
            result += count
        }
    }
    return result
}
