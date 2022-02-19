import XCTest
import TestLibrary

let cases: [TestCase] = [
(#filePath, #line,
"""
2 3
1 2 3
4 5 6
""", """
9
0 -3 -1
3 0 2
"""),
(#filePath, #line,
"""
2 2
1000000000 -1000000000
-1000000000 1000000000
""", """
4000000000
2000000000 0
0 2000000000
"""),
(#filePath, #line,
"""
3 4
0 2 0 -2
-3 -1 2 0
-3 -3 2 2
""", """
0
0 0 0 0
0 0 0 0
0 0 0 0
"""),
]

final class DTests: XCTestCase, TimeLimit {
    let timeLimit: TimeInterval = 2.0

    func testExample() throws {
        try cases.forEach(solve)
    }
}