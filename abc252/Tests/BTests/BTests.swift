import XCTest
import TestLibrary

let cases: [TestCase] = [
(#filePath, #line,
"""
5 3
6 8 10 7 10
2 3 4
""", """
Yes
"""),
(#filePath, #line,
"""
5 2
100 100 100 1 1
5 4
""", """
No
"""),
(#filePath, #line,
"""
2 1
100 1
2
""", """
No
"""),
]

final class BTests: XCTestCase, TimeLimit {
    let timeLimit: TimeInterval = 2.0

    func testExample() throws {
        try cases.forEach(solve)
    }
}