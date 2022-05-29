import XCTest
import TestLibrary

let cases: [TestCase] = [
(#filePath, #line,
"""
2
1 2 4 3
4 3 1 2
""", """
())(
"""),
(#filePath, #line,
"""
2
1 3 2 4
4 3 2 1
""", """
-1
"""),
(#filePath, #line,
"""
3
2 1 5 3 4 6
6 5 3 4 2 1
""", """
-1
"""),
]

final class CTests: XCTestCase, TimeLimit {
    let timeLimit: TimeInterval = 2.0

    func testExample() throws {
        try cases.forEach(solve)
    }
}