import XCTest
import TestLibrary

let cases: [TestCase] = [
(#filePath, #line,
"""
3
-1 1 3
""", """
5
"""),
(#filePath, #line,
"""
1
1
""", """
1
"""),
(#filePath, #line,
"""
8
-1 3 -1 -1 8 -1 -1 -1
""", """
433760
"""),
]

final class DTests: XCTestCase, TimeLimit {
    let timeLimit: TimeInterval = 2.0

    func testExample() throws {
        try cases.forEach(solve)
    }
}