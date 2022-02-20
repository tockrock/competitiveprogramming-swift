import XCTest
import TestLibrary

let cases: [TestCase] = [
(#filePath, #line,
"""
6
1 4 1 2 2 1
""", """
3
"""),
(#filePath, #line,
"""
1
1
""", """
1
"""),
(#filePath, #line,
"""
11
3 1 4 1 5 9 2 6 5 3 5
""", """
7
"""),
]

final class BTests: XCTestCase, TimeLimit {
    let timeLimit: TimeInterval = 2.0

    func testExample() throws {
        try cases.forEach(solve)
    }
}