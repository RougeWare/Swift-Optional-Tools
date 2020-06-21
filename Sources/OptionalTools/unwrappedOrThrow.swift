//
//  unwrappedOrThrow.swift
//  OptionalTools
//
//  Created by Ben Leggiero on 2019-12-10.
//  Copyright © 2019 Ben Leggiero. All rights reserved.
//



public extension Optional {
    
    /// If this contains a value, it is returned. Otherwise, an error is thrown.
    ///
    /// - Parameter error: _optional_ - The error to throw if there is no value to return.
    ///                    Defaults to `UnexpectedlyFoundNilError`
    func unwrappedOrThrow(error: @autoclosure () -> Error = UnexpectedlyFoundNilError()) throws -> Wrapped {
        switch self {
        case .some(let wrapped): return wrapped
        case .none: throw error()
        }
    }
}



/// Thrown when some operation attempted to read a value, but instead read `nil`
public struct UnexpectedlyFoundNilError: Error {
    public init() {}
}
