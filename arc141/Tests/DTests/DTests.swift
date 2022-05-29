import XCTest
import TestLibrary

let cases: [TestCase] = [
(#filePath, #line,
"""
5 3
1 2 3 4 5
""", """
No
Yes
Yes
Yes
Yes
"""),
(#filePath, #line,
"""
4 4
2 4 6 8
""", """
No
No
No
No
"""),
(#filePath, #line,
"""
13 10
2 3 4 6 7 9 10 11 13 15 17 19 20
""", """
No
No
Yes
Yes
Yes
Yes
Yes
Yes
Yes
Yes
Yes
Yes
No
"""),
]

final class DTests: XCTestCase, TimeLimit {
    let timeLimit: TimeInterval = 2.0

    func testExample() throws {
        try cases.forEach(solve)
    }
}