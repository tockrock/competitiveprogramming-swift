import XCTest
import TestLibrary

let cases: [TestCase] = [
(#filePath, #line,
"""
3 4
4 3 6
5 2 3 4
1 2 3 2
2 1 2 3
3 2 1 2
""", """
37
"""),
(#filePath, #line,
"""
1 1
10
10
0
""", """
0
"""),
(#filePath, #line,
"""
5 6
3 2 6 7 5
4 9 8 6 2 3
2 0 2 1 1 0
2 3 2 1 0 0
2 2 4 0 2 2
4 1 0 3 0 2
1 0 0 2 2 5
""", """
79
"""),
]

final class HTests: XCTestCase, TimeLimit {
    let timeLimit: TimeInterval = 2.0

    func testExample() throws {
        try cases.forEach(solve)
    }
}