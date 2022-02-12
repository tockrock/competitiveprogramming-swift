import XCTest
import TestLibrary

let cases: [TestCase] = [
(#filePath, #line,
"""
4
0 1
1 3
1 1
-1 -1
""", """
3
"""),
(#filePath, #line,
"""
20
224 433
987654321 987654321
2 0
6 4
314159265 358979323
0 0
-123456789 123456789
-1000000000 1000000000
124 233
9 -6
-4 0
9 5
-7 3
333333333 -333333333
-9 -1
7 -10
-1 5
324 633
1000000000 -1000000000
20 0
""", """
1124
"""),
]

final class CTests: XCTestCase, TimeLimit {
    let timeLimit: TimeInterval = 2.0

    func testExample() throws {
        try cases.forEach(solve)
    }
}