import XCTest
import TestLibrary

let cases: [TestCase] = [
(#filePath, #line,
"""
5 5
1
2
3
4
5
""", """
1 2 3 5 4
"""),
(#filePath, #line,
"""
7 7
7
7
7
7
7
7
7
""", """
1 2 3 4 5 7 6
"""),
(#filePath, #line,
"""
10 6
1
5
2
9
6
6
""", """
1 2 3 4 5 7 6 8 10 9
"""),
]

final class CTests: XCTestCase, TimeLimit {
    let timeLimit: TimeInterval = 2.0

    func testExample() throws {
        try cases.forEach(solve)
    }
}
