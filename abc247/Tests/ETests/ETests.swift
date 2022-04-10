import XCTest
import TestLibrary

let cases: [TestCase] = [
(#filePath, #line,
"""
4 3 1
1 2 3 1
""", """
4
"""),
(#filePath, #line,
"""
5 2 1
1 3 2 4 1
""", """
0
"""),
(#filePath, #line,
"""
5 1 1
1 1 1 1 1
""", """
15
"""),
(#filePath, #line,
"""
10 8 1
2 7 1 8 2 8 1 8 2 8
""", """
36
"""),
]

final class ETests: XCTestCase, TimeLimit {
    let timeLimit: TimeInterval = 2.0

    func testExample() throws {
        try cases.forEach(solve)
    }
}