import XCTest
import TestLibrary

let cases: [TestCase] = [
(#filePath, #line,
"""
3 3 9
1 1 2 1
3 2 2
2 3 2
3 3 3
3 3 1
1 2 3 3
3 3 2
3 2 3
3 1 2
""", """
1
2
2
5
3
4
"""),
(#filePath, #line,
"""
1 1 10
1 1 1 1000000000
1 1 1 1000000000
1 1 1 1000000000
1 1 1 1000000000
1 1 1 1000000000
1 1 1 1000000000
1 1 1 1000000000
1 1 1 1000000000
1 1 1 1000000000
3 1 1
""", """
9000000000
"""),
(#filePath, #line,
"""
10 10 10
1 1 8 5
2 2 6
3 2 1
3 4 7
1 5 9 7
3 3 2
3 2 8
2 8 10
3 8 8
3 1 10
""", """
6
5
5
13
10
0
"""),
]

final class FTests: XCTestCase, TimeLimit {
    let timeLimit: TimeInterval = 2.0

    func testExample() throws {
        try cases.forEach(solve)
    }
}