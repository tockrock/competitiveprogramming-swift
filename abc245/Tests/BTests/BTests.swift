import XCTest
import TestLibrary

let cases: [TestCase] = [
(#filePath, #line,
"""
8
0 3 2 6 2 1 0 0
""", """
4
"""),
(#filePath, #line,
"""
3
2000 2000 2000
""", """
0
"""),
]

final class BTests: XCTestCase, TimeLimit {
    let timeLimit: TimeInterval = 2.0

    func testExample() throws {
        try cases.forEach(solve)
    }
}