import XCTest
import TestLibrary

let cases: [TestCase] = [
(#filePath, #line,
"""
6
AARCCC
""", """
2
"""),
(#filePath, #line,
"""
5
AAAAA
""", """
0
"""),
(#filePath, #line,
"""
9
ARCARCARC
""", """
3
"""),
]

final class BTests: XCTestCase, TimeLimit {
    let timeLimit: TimeInterval = 2.0

    func testExample() throws {
        try cases.forEach(solve)
    }
}