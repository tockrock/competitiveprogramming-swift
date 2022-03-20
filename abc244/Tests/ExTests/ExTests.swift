import XCTest
import TestLibrary

let cases: [TestCase] = [
(#filePath, #line,
"""
4
1 0 -1 -1
0 1 2 0
-1 0 1 1
0 -1 1 -2
""", """
-1
2
1
2
"""),
(#filePath, #line,
"""
9
-1 4 -8 -2
9 -9 -7 7
4 1 6 7
-4 -1 -4 -5
-9 3 -2 -6
-1 0 -8 5
-8 -5 0 0
8 3 0 -4
2 -5 2 5
""", """
0
35
31
21
36
87
0
36
31
"""),
]

final class ExTests: XCTestCase, TimeLimit {
    let timeLimit: TimeInterval = 5.0

    func testExample() throws {
        try cases.forEach(solve)
    }
}