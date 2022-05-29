import XCTest
import TestLibrary

let cases: [TestCase] = [
(#filePath, #line,
"""
3 3
0 0 1 2
2 0 0 0
1 1 2 2
""", """
6
4
4
"""),
(#filePath, #line,
"""
4 3
0 0 2 2
2 3 1 2
1 1 3 3
""", """
14
11
11
"""),
(#filePath, #line,
"""
6 5
0 0 1 1
1 2 3 4
1 1 5 3
2 0 1 5
5 0 3 3
""", """
31
27
21
21
19
"""),
]

final class ETests: XCTestCase, TimeLimit {
    let timeLimit: TimeInterval = 3.0

    func testExample() throws {
        try cases.forEach(solve)
    }
}