//
//  Brackets.swift
//  AlgorithmHub
//
//  Created by Muzahidul Islam on 8/5/20.
//  Copyright © 2020 Muzahid. All rights reserved.
//

import Foundation

/**
    Determine whether a given string of parentheses (multiple types) is properly nested.
    For example, the string "{[()()]}" is properly nested but "([)()]" is not.
 */

func checkProperParenthese(_ S: String) -> Int {
    var stack: [Character] = []
    let opening: [Character] = ["(", "{", "["]
    let closing: [Character] = [")", "}", "]"]
    for c in S {
        if opening.contains(c) {
            stack.insert(c, at: 0)
        } else if closing.contains(c) {
            if stack.isEmpty {
                return 0
            }
            let top = stack.remove(at: 0)
            let isPair = checkPair(top, c2: c)
            if !isPair {
                return 0
            }
        } else {
            return 0
        }
        
    }
    return stack.count == 0 ? 1 : 0
}

fileprivate func checkPair(_ c1: Character, c2: Character) -> Bool {
    switch (c1, c2) {
    case ("(", ")"): return true
    case ("{", "}"): return true
    case ("[", "]"): return true
    default: return false
    }
}


