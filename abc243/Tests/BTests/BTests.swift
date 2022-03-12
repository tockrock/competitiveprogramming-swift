import XCTest
import TestLibrary

let cases: [TestCase] = [
(#filePath, #line,
"""
4
1 3 5 2
2 3 1 4
""", """
1
2
"""),
(#filePath, #line,
"""
3
1 2 3
4 5 6
""", """
0
0
"""),
(#filePath, #line,
"""
7
4 8 1 7 9 5 6
3 5 1 7 8 2 6
""", """
3
2
"""),
]

final class BTests: XCTestCase, TimeLimit {
    let timeLimit: TimeInterval = 2.0

    func testExample() throws {
        try cases.forEach(solve)
    }
}