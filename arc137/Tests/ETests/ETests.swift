import XCTest
import TestLibrary

let cases: [TestCase] = [
(#filePath, #line,
"""
7 4 3
1 1 1 1 1 1 1
1 2 3
2 4 5
4 6 3
6 7 1
""", """
11
"""),
(#filePath, #line,
"""
3 1 5
1 1 1
2 2 10
""", """
0
"""),
(#filePath, #line,
"""
10 10 42
6 5 1 5 2 4 2 7 10 9
3 4 4
3 7 136
9 9 14
2 7 152
3 3 33
2 4 100
3 3 38
1 10 28
3 5 66
8 8 15
""", """
543
"""),
]

final class ETests: XCTestCase, TimeLimit {
    let timeLimit: TimeInterval = 4.0

    func testExample() throws {
        try cases.forEach(solve)
    }
}