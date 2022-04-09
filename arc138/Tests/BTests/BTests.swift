import XCTest
import TestLibrary

let cases: [TestCase] = [
(#filePath, #line,
"""
4
0 1 1 0
""", """
Yes
"""),
(#filePath, #line,
"""
4
1 0 0 0
""", """
No
"""),
(#filePath, #line,
"""
4
0 0 0 1
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