import XCTest
import TestLibrary

let cases: [TestCase] = [
(#filePath, #line,
"""
7 8 7
3 4
5 6
1 4
2 1
2 8
4 5
5 7
6 2
6 6
""", """
4
"""),
(#filePath, #line,
"""
4 6 2
3 2
3 5
4 5
2 5
""", """
-1
"""),
(#filePath, #line,
"""
1 10 1
1 5
1 1
1 7
""", """
-1
"""),
]

final class FTests: XCTestCase, TimeLimit {
    let timeLimit: TimeInterval = 2.0

    func testExample() throws {
        try cases.forEach(solve)
    }
}