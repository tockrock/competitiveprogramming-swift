import XCTest
import TestLibrary

let cases: [TestCase] = [
(#filePath, #line,
"""
4
3 1 4 5
4 1 5 3
""", """
Yes
"""),
(#filePath, #line,
"""
3
1 2 2
2 1 2
""", """
Yes
"""),
(#filePath, #line,
"""
3
1 2 3
2 3 4
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