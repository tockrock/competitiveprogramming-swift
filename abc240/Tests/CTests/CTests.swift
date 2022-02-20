import XCTest
import TestLibrary

let cases: [TestCase] = [
(#filePath, #line,
"""
2 10
3 6
4 5
""", """
Yes
"""),
(#filePath, #line,
"""
2 10
10 100
10 100
""", """
No
"""),
(#filePath, #line,
"""
4 12
1 8
5 7
3 4
2 6
""", """
Yes
"""),
]

final class CTests: XCTestCase, TimeLimit {
    let timeLimit: TimeInterval = 2.0

    func testExample() throws {
        try cases.forEach(solve)
    }
}