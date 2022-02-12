import XCTest
import TestLibrary

let cases: [TestCase] = [
(#filePath, #line,
"""
3 3
2 1 4
3 1 3
6 4 1
""", """
Yes
"""),
(#filePath, #line,
"""
2 4
4 3 2 1
5 6 7 8
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