import XCTest
import TestLibrary

let cases: [TestCase] = [
(#filePath, #line,
"""
9 0 1 2 3 4 5 6 7 8
""", """
7
"""),
(#filePath, #line,
"""
4 8 8 8 0 8 8 8 8 8
""", """
4
"""),
(#filePath, #line,
"""
0 0 0 0 0 0 0 0 0 0
""", """
0
"""),
]

final class ATests: XCTestCase, TimeLimit {
    let timeLimit: TimeInterval = 2.0

    func testExample() throws {
        try cases.forEach(solve)
    }
}