import XCTest
import TestLibrary

let cases: [TestCase] = [
(#filePath, #line,
"""
4
1 1 3 2
""", """
3
"""),
(#filePath, #line,
"""
3
1 1 1
""", """
0
"""),
(#filePath, #line,
"""
10
2 2 4 1 1 1 4 2 2 1
""", """
8
"""),
]

final class BTests: XCTestCase, TimeLimit {
    let timeLimit: TimeInterval = 2.0

    func testExample() throws {
        try cases.forEach(solve)
    }
}