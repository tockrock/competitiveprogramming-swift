import XCTest
import TestLibrary

let cases: [TestCase] = [
(#filePath, #line,
"""
5 2
3 4 1 3 4
""", """
Yes
"""),
(#filePath, #line,
"""
5 3
3 4 1 3 4
""", """
No
"""),
(#filePath, #line,
"""
7 5
1 2 3 4 5 5 10
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
