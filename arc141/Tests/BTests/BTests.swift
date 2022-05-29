import XCTest
import TestLibrary

let cases: [TestCase] = [
(#filePath, #line,
"""
2 4
""", """
5
"""),
(#filePath, #line,
"""
4 4
""", """
0
"""),
(#filePath, #line,
"""
10 123456789
""", """
205695670
"""),
]

final class BTests: XCTestCase, TimeLimit {
    let timeLimit: TimeInterval = 2.0

    func testExample() throws {
        try cases.forEach(solve)
    }
}