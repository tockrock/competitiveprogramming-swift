import XCTest
import TestLibrary

let cases: [TestCase] = [
(#filePath, #line,
"""
3 6
""", """
code
"""),
(#filePath, #line,
"""
4 4
""", """
o
"""),
(#filePath, #line,
"""
1 7
""", """
atcoder
"""),
]

final class ATests: XCTestCase, TimeLimit {
    let timeLimit: TimeInterval = 2.0

    func testExample() throws {
        try cases.forEach(solve)
    }
}