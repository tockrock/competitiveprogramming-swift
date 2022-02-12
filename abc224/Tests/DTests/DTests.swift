import XCTest
import TestLibrary

let cases: [TestCase] = [
(#filePath, #line,
"""
5
1 2
1 3
1 9
2 9
3 9
3 9 2 4 5 6 7 8
""", """
5
"""),
(#filePath, #line,
"""
5
1 2
1 3
1 9
2 9
3 9
1 2 3 4 5 6 7 8
""", """
0
"""),
(#filePath, #line,
"""
12
8 5
9 6
4 5
4 1
2 5
8 9
2 1
3 6
8 7
6 5
7 4
2 3
1 2 3 4 5 6 8 7
""", """
-1
"""),
(#filePath, #line,
"""
12
6 5
5 4
4 1
4 7
8 5
2 1
2 5
6 9
3 6
9 8
8 7
3 2
2 3 4 6 1 9 7 8
""", """
16
"""),
]

final class DTests: XCTestCase, TimeLimit {
    let timeLimit: TimeInterval = 4.0

    func testExample() throws {
        try cases.forEach(solve)
    }
}