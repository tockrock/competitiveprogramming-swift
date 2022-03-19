import XCTest
import TestLibrary

let cases: [TestCase] = [
(#filePath, #line,
"""
4
0 1 1 0
""", """
4
"""),
(#filePath, #line,
"""
5
0 0 0 0 0
""", """
6
"""),
(#filePath, #line,
"""
6
0 1 0 1 0 1
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