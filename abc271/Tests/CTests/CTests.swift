import XCTest
import TestLibrary

let cases: [TestCase] = [
(#filePath, #line,
"""
6
1 2 4 6 7 271
""", """
4
"""),
(#filePath, #line,
"""
10
1 1 1 1 1 1 1 1 1 1
""", """
5
"""),
(#filePath, #line,
"""
1
5
""", """
0
"""),
]

final class CTests: XCTestCase, TimeLimit {
    let timeLimit: TimeInterval = 4.0

    func testExample() throws {
        try cases.forEach(solve)
    }
}