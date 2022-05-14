import XCTest
import TestLibrary

let cases: [TestCase] = [
(#filePath, #line,
"""
2 10
1 3
""", """
3
"""),
(#filePath, #line,
"""
2 1
2 3
""", """
0
"""),
(#filePath, #line,
"""
4 12
3 3 3 3
""", """
3
"""),
(#filePath, #line,
"""
7 251
202 20 5 1 4 2 100
""", """
48
"""),
]

final class BTests: XCTestCase, TimeLimit {
    let timeLimit: TimeInterval = 2.0

    func testExample() throws {
        try cases.forEach(solve)
    }
}