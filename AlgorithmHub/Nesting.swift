//
//  Nesting.swift
//  AlgorithmHub
//
//  Created by Muzahidul Islam on 9/5/20.
//  Copyright © 2020 Muzahid. All rights reserved.
//

import Foundation

class Nesting {
    class func solution(_ S: String) -> Int {
        if S.isEmpty {
            return 1
        }
        
        if S.count == 1 {
            return 0
        }
        
        let opening: Character = "("

        var count = 0
        for c in S {
            if c == opening {
                count += 1
            } else {
                if count <= 0 {
                    return 0
                } else {
                    count -= 1
                }
            }
        }
        return count == 0 ? 1 : 0
    }
}
