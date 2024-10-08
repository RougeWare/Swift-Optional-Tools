//
//  unwrappedOrThrow.swift
//  OptionalTools
//
//  Created by Ben Leggiero on 2019-12-10.
//  Copyright © 2019 Ben Leggiero. All rights reserved.
//



#if compiler(>=6) || swift(>=6)
public extension Optional {
    
    /// If this contains a value, it is returned. Otherwise, the given error is thrown.
    ///
    /// - Parameter error: _optional_ - The error to throw if there is no value to return.
    ///                    Defaults to `UnexpectedlyFoundNilError`
    ///
    /// - Throws: The given `error` if this is `nil`
    @inline(__always)
    func unwrappedOrThrow() throws(UnexpectedlyFoundNilError) -> Wrapped {
        try unwrappedOrThrow(error: UnexpectedlyFoundNilError())
    }
    
    
    /// If this contains a value, it is returned. Otherwise, the given error is thrown.
    ///
    /// - Parameter error: _optional_ - The error to throw if there is no value to return.
    ///                    Defaults to `UnexpectedlyFoundNilError`
    ///
    /// - Throws: The given `error` if this is `nil`
    @inlinable
    func unwrappedOrThrow<ErrorToThrow>(error: @autoclosure () -> ErrorToThrow) throws(ErrorToThrow) -> Wrapped {
        switch self {
        case .some(let wrapped): return wrapped
        case .none: throw error()
        }
    }
}
#else
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
#endif



/// Thrown when some operation attempted to read a value, but instead read `nil`
public struct UnexpectedlyFoundNilError: Error {
    public init() {}
}
