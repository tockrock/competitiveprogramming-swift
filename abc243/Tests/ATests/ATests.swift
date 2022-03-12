import XCTest
import TestLibrary

let cases: [TestCase] = [
(#filePath, #line,
"""
25 10 11 12
""", """
T
"""),
(#filePath, #line,
"""
30 10 10 10
""", """
F
"""),
(#filePath, #line,
"""
100000 1 1 1
""", """
M
"""),
]

final class ATests: XCTestCase, TimeLimit {
    let timeLimit: TimeInterval = 2.0

    func testExample() throws {
        try cases.forEach(solve)
    }
}