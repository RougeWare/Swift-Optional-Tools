//
//  Optional operators.swift
//  OptionalTools
//
//  Created by Ben Leggiero on 2020-06-20.
//  Copyright © 2020 Ben Leggiero. All rights reserved.
//

import Foundation



infix operator -?
infix operator +?
infix operator =?



public extension Optional where Wrapped: AdditiveArithmetic {
    /// If both have a value, then this returns the result of left minus right. Otherwise, this returns `nil`.
    ///
    /// - Parameters:
    ///   - lhs: The value before the minus sign
    ///   - rhs: The value after the minus sign
    ///
    /// - Returns: If both have a value, the result of left minus right. Otherwise `nil`.
    static func -? (lhs: Self, rhs: Self) -> Self {
        if let lhs = lhs,
            let rhs = rhs {
            return lhs - rhs
        }
        else {
            return nil
        }
    }
    
    
    /// If both have a value, then this returns the result of left plus right. Otherwise, this returns `nil`.
    ///
    /// - Parameters:
    ///   - lhs: The value before the plus sign
    ///   - rhs: The value after the plus sign
    ///
    /// - Returns: If both have a value, the result of left [plus] right. Otherwise `nil`.
    static func +? (lhs: Self, rhs: Self) -> Self {
        if let lhs = lhs,
            let rhs = rhs {
            return lhs + rhs
        }
        else {
            return nil
        }
    }
}



/// If the right has a value, it's assigned to the left. Otherwise no action is taken.
///
/// - Parameters:
///   - lhs: A value which might change
///   - rhs: Either the new value of `lhs`, or nothing at all
public func =? <T> (lhs: inout T, rhs: T?) {
    if let rhs = rhs {
        lhs = rhs
    }
}
