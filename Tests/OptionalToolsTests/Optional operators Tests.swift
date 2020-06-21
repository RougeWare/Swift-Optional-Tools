//
//  Optional operators.swift
//  OptionalTools
//
//  Created by Ben Leggiero on 2020-06-20.
//  Copyright © 2020 Ben Leggiero. All rights reserved.
//

import XCTest
import OptionalTools



final class Optional_operators_Tests: XCTestCase {
    
    func test_minusQuestionMark() {
        
        let nilInt: Int? = nil
        let one: Int? = 1
        let two: Int? = 2
        
        
        XCTAssertNil(nilInt -? nilInt)
        XCTAssertNil(nilInt -? two)
        XCTAssertNil(one -? nilInt)
        XCTAssertEqual(one -? two, -1)
    }
    
    
    func test_plusQuestionMark() {
        
        let nilInt: Int? = nil
        let one: Int? = 1
        let two: Int? = 2
        
        
        XCTAssertNil(nilInt +? nilInt)
        XCTAssertNil(nilInt +? two)
        XCTAssertNil(one +? nilInt)
        XCTAssertEqual(one +? two, 3)
    }
    
    
    func test_assignQuestionMark() {
        var x: Int = 7
        
        XCTAssertEqual(x, 7)
        
        x =? nil
        
        XCTAssertEqual(x, 7)
        
        x =? 11
        
        XCTAssertEqual(x, 11)
        
        x =? nil
        
        XCTAssertEqual(x, 11)
    }
    
    
    static var allTests = [
        ("test_minusQuestionMark", test_minusQuestionMark),
        ("test_plusQuestionMark", test_plusQuestionMark),
        ("test_assignQuestionMark", test_assignQuestionMark),
    ]
}
