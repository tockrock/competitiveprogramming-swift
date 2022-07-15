import XCTest
import TestLibrary

let cases: [TestCase] = [
(#filePath, #line,
"""
4
-10 0 1
0 0 5
10 0 1
11 0 1
""", """
2
"""),
(#filePath, #line,
"""
7
20 31 1
13 4 3
-10 -15 2
34 26 5
-2 39 4
0 -50 1
5 -20 2
""", """
18
"""),
]

final class DTests: XCTestCase, TimeLimit {
    let timeLimit: TimeInterval = 3.0

    func testExample() throws {
        try cases.forEach(solve)
    }
}