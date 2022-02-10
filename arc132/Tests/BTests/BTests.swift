import XCTest
import TestLibrary

let cases: [TestCase] = [
(#filePath, #line,
"""
3
1 3 2
""", """
2
"""),
(#filePath, #line,
"""
2
2 1
""", """
1
"""),
(#filePath, #line,
"""
10
2 3 4 5 6 7 8 9 10 1
""", """
3
"""),
(#filePath, #line,
"""
12
1 2 3 4 5 6 7 8 9 10 11 12
""", """
0
"""),
]

final class BTests: XCTestCase, TimeLimit {
    let timeLimit: TimeInterval = 2.0

    func testExample() throws {
        try cases.forEach(solve)
    }
}