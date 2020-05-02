//
//  MaxBinaryGap.swift
//  AlgorithmHub
//
//  Created by Muzahidul Islam on 2/5/20.
//  Copyright © 2020 Muzahid. All rights reserved.
//

import Foundation

func findBinaryGap(_ N: Int) -> Int {
    var a = N
    let bitNumber = log2(Double(a))
    if floor(bitNumber) == bitNumber {
        return 0
    }
    
    let array = intToBinary(&a)
    var maxGap = 0
    var current: Int? = nil
    var next: Int? = nil
    
    for (i,e) in array.enumerated() {
        let one = 1
        if e == one {
            if current == nil {
                current = i
            } else {
                next = i
            }
        }
        
        if current != nil && next != nil {
            let dif = (next! - current!) - 1
            if dif > maxGap  {
                maxGap = dif
            }
            current = next
            next = nil
        }
        
    }
    return maxGap
}

fileprivate func intToBinary(_ a: inout Int) -> [Int] {
    var result: [Int] = []
    repeat {
        let remainder = a % 2
        result.insert(remainder, at: 0)
        a = a / 2
    } while a != 0
    
    return result
}
