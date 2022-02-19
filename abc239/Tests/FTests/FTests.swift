import XCTest
import TestLibrary

let cases: [TestCase] = [
(#filePath, #line,
"""
6 2
1 2 1 2 2 2
2 3
1 4
""", """
6 2
5 6
4 5
"""),
(#filePath, #line,
"""
5 1
1 1 1 1 4
2 3
""", """
-1
"""),
(#filePath, #line,
"""
4 0
3 3 3 3
""", """
-1
"""),
]

final class FTests: XCTestCase, TimeLimit {
    let timeLimit: TimeInterval = 2.0

    func testExample() throws {
        try cases.forEach(solve)
    }
}