//
//  Fish.swift
//  AlgorithmHub
//
//  Created by Muzahidul Islam on 9/5/20.
//  Copyright © 2020 Muzahid. All rights reserved.
//

import Foundation

class Fish {
    
    class func solution(_ A: [Int], B: [Int]) -> Int {
        if A.isEmpty || B.isEmpty || A.count != B.count {
            return -1
        }
        var stack: [Int] = []
        var alive = 0
        for i in 0..<A.count {
            let e = A[i]
            
            if B[i] == 1 {
                stack.insert(e, at: 0)
            }  else {
                while !stack.isEmpty {
                    let top = stack.first!
                    if top > e {
                        break
                    } else {
                        _ = stack.removeFirst()
                    }
                }
                
                if stack.isEmpty {
                    alive += 1
                }
            }
        }
        
        return alive + stack.count
    }
    
    
}
