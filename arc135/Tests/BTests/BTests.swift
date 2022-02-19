import XCTest
import TestLibrary

let cases: [TestCase] = [
(#filePath, #line,
"""
5
6 9 6 6 5
""", """
Yes
0 4 2 3 1 2 2
"""),
(#filePath, #line,
"""
5
0 1 2 1 0
""", """
No
"""),
(#filePath, #line,
"""
1
10
""", """
Yes
0 0 10
"""),
]

final class BTests: XCTestCase, TimeLimit {
    let timeLimit: TimeInterval = 2.0

    func testExample() throws {
        try cases.forEach(solve)
    }
}
