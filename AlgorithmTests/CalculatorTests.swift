//
//  CalculatorTests.swift
//  AlgorithmTests
//
//  Created by Muzahidul Islam on 14/4/20.
//  Copyright © 2020 Muzahid. All rights reserved.
//

import XCTest
@testable import Algorithm

class CalculatorTests: XCTestCase {
    var calculator: PostFixCalculator?
    
    override func setUp() {
        calculator = PostFixCalculator()
    }
    
    func testOperation()  {
       
        let expression1 = "2 3 4 + -"
        /// Evaluation
        // 4 + 3 = 7
        // 7 - 2 = 5
        XCTAssertEqual(try? calculator?.evaluate(expression1), 5)
        
        let expression2 = "10 3 10 % +"
        /// 10 % 3 = 1
        /// 1 + 10 = 11
        XCTAssertEqual(try? calculator?.evaluate(expression2), 11)
        
        let expression3 = "6 7 8 10 * + /"
        /// 10 * 8 = 80
        /// 88 + 7 = 95
        /// 95 / 6 = 14
        XCTAssertEqual(try? calculator?.evaluate(expression3), 14)
        
    }
    
    func testEception() {
        let invalidOperator = "3 4 6 / ^"
        
        XCTAssertThrowsError(try calculator?.evaluate(invalidOperator)) { error in
            XCTAssertEqual(error as? PostFixCalculator.Exception, .invalidOperator)
        }
        
        let invalidExpression = "3 x 6  / +"
        
        XCTAssertThrowsError(try calculator?.evaluate(invalidExpression)) { error in
            XCTAssertEqual(error as? PostFixCalculator.Exception, .invalidExpression)
        }
        
    }
    
    override func tearDown() {
        calculator = nil
    }
    
}
