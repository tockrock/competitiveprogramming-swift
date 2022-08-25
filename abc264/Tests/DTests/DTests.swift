import XCTest
import TestLibrary

let cases: [TestCase] = [
(#filePath, #line,
"""
catredo
""", """
8
"""),
(#filePath, #line,
"""
atcoder
""", """
0
"""),
(#filePath, #line,
"""
redocta
""", """
21
"""),
]

final class DTests: XCTestCase, TimeLimit {
    let timeLimit: TimeInterval = 2.0

    func testExample() throws {
        try cases.forEach(solve)
    }
}