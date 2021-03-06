//
//  AlgorithmHubTests.swift
//  AlgorithmHubTests
//
//  Created by Muzahidul Islam on 13/4/20.
//  Copyright © 2020 Muzahid. All rights reserved.
//

import XCTest
@testable import AlgorithmHub

class AlgorithmHubTests: XCTestCase {

    override func setUp() {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    func testTapeEquilibrium() {
        XCTAssertEqual(1, tapeEquilibrium([3, 1, 2, 4, 3]))
        XCTAssertEqual(1, tapeEquilibrium([-4, 3]))
    }
    
    func testBinaryGap() {
        XCTAssertEqual(0, findBinaryGap(32))
        XCTAssertEqual(5, findBinaryGap(1041)) 
    }
    
    func testFrogRiverOne() {
        XCTAssertEqual(6, frogRiverOneSolution(5, A: [1,3,1,4,2,3,5,4]))
        XCTAssertEqual(-1, frogRiverOneSolution(5, A: [1,3,1,4,2,3,2,4]))
        XCTAssertEqual(8, frogRiverOneSolution(5, A: [1,3,1,4,2,3,4,1,5]))
    }
    
    func testMissingInteger() {
        XCTAssertEqual(4, missingIntegerSolution([1,2,3]))
        XCTAssertEqual(5, missingIntegerSolution([1, 3, 6, 4, 1, 2]))
    }
    
    func testPermCheck() {
        XCTAssertEqual(1, permCheckSolution([4, 1, 3, 2]))
        XCTAssertEqual(0, permCheckSolution([4, 1, 3]))
    }
    
    func testMaxCounters() {
        XCTAssertEqual([3,2,2,4,2], maxCountersSolution(5, A: [3,4,4,6,1,4,4]))
        XCTAssertEqual([1,0,2,4,0], maxCountersSolution(5, A: [3,4,4,3,1,4,4]))
        
    }
    
    func testCountDiv() {
//        A = B in {0,1}, K = 11
//        A = 10, B = 10, K in {5,7,20}
        XCTAssertEqual(5, countDiv(10, B: 10, K: 2))
        XCTAssertEqual(1, countDiv(10, B: 10, K: 7))
        XCTAssertEqual(3, countDiv(5, B: 11, K: 2))
        
    }
    
    func testGenomicRange() {
        XCTAssertEqual([2, 4, 1], genomicRangeQuery("CAGCCTA", P: [2,5,0], Q: [4,5,6]))
        XCTAssertEqual([2, 2, 1], genomicRangeQuery("CAGCCTA", P: [0,2,6], Q: [0,5,6]))
    }
    
    func testMinAvgTwoSlice() {
        XCTAssertEqual(1, minAvgTwoSlice([4, 2, 2, 5, 1, 5, 8]))
    }
    
    func testPassingCar() {
        XCTAssertEqual(5, passingCarSolution2([0, 1, 0, 1, 1]))
    }
    
    func testFindDistinct() {
        XCTAssertEqual(3, findDistinct([2, 1, 1, 2, 3, 1]))
        XCTAssertEqual(3, findDistinct2([2, 1, 1, 2, 3, 1]))
    }
    
    func testCheckTriangle() {
        XCTAssertEqual(true, checkTriangle([10, 2, 5, 1, 8, 20]))
        XCTAssertEqual(false, checkTriangle([1, 5, 3]))
        XCTAssertEqual(true, checkTriangle1([10, 2, 5, 1, 8, 20]))
        XCTAssertEqual(false, checkTriangle1([1, 5, 3]))
    }
    
    func testProperParenthesis() {
        XCTAssertEqual(1, checkProperParenthese("{[()()]}"))
        XCTAssertEqual(0, checkProperParenthese("([)()]"))
    }
    
    func testFishAlive() {
        XCTAssertEqual(2, Fish.solution([4,3,2,1,5], B: [0,1,0,0,0]))
    }
    
    func testNesting() {
        XCTAssertEqual(1, Nesting.solution("(()(())())"))
        XCTAssertEqual(0, Nesting.solution("())"))
    }
    
    func testDominator() {
        var array1 = [3, 4, 3, 2, 3, -2, 3, 3]
        
        XCTAssertTrue([0, 1, 4, 6,7].contains(Dominator.solution(&array1)))
        XCTAssertTrue([0, 1, 4, 6,7].contains(Dominator.solution1(&array1)))
//        XCTAssertEqual(3, Dominator.solution1(&array1))
        var array2 = [3, 4, 3, 2]
        XCTAssertEqual(-1, Dominator.solution(&array2))
//        XCTAssertEqual(-1, Dominator.solution1(&array2))
    }
    
    func testEquileader() {
        var input = [4, 3, 4, 4, 4, 2]
        let count = Equileader.solution1(&input)
        XCTAssertTrue(count == 2)
        
        var input2 = [4, 4]
        let count2 = Equileader.solution1(&input2)
        XCTAssertTrue(count2 == 1)
    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testExample() {
        // This is an example of a functional test case.
        // Use XCTAssert and related functions to verify your tests produce the correct results.
    }

    func testPerformanceExample() {
        // This is an example of a performance test case.
        self.measure {
            // Put the code you want to measure the time of here.
        }
    }

}
