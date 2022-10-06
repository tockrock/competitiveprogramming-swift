import XCTest
import TestLibrary

let cases: [TestCase] = [
(#filePath, #line,
"""
3 11
1 4
2 3
5 7
""", """
Yes
THH
"""),
(#filePath, #line,
"""
5 25
2 8
9 3
4 11
5 1
12 6
""", """
No
"""),
]

final class DTests: XCTestCase, TimeLimit {
    let timeLimit: TimeInterval = 2.0

    func testExample() throws {
        try cases.forEach(solve)
    }
}