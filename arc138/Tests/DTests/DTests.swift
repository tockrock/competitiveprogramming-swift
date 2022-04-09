import XCTest
import TestLibrary

let cases: [TestCase] = [
(#filePath, #line,
"""
3 1
""", """
Yes
0 1 3 2 6 7 5 4
"""),
(#filePath, #line,
"""
2 2
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