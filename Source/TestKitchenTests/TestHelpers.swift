//
// Created by Boris Schneiderman on 6/29/17.
// Copyright (c) 2017 Boris Schneiderman. All rights reserved.
//

import XCTest

precedencegroup LeftApplyPrecedence {
  associativity: left
  higherThan: AssignmentPrecedence
  lowerThan: TernaryPrecedence
}

infix operator |> : LeftApplyPrecedence
func |> <A, B> (x: A, f: (A) -> B) -> B {
  return f(x)
}

func relevantValues<T: Equatable>(_ valuesToUse: [T]) -> ([T]) -> [T] {
  return { allValues in
    return allValues.filter { valuesToUse.contains($0) }
  }
}


func assertExpectedValues<T: Equatable>(_ expectedValues: [T], _ fromAllValues: [T], _ message: String? = nil , file: StaticString = #file, line: UInt = #line) {

  let actualValues = relevantValues(expectedValues)(fromAllValues)

  if let message = message {
    XCTAssertEqual(expectedValues, actualValues, message, file: file, line: line)
  }
  else {
    XCTAssertEqual(expectedValues, actualValues , file: file, line: line)
  }
}
