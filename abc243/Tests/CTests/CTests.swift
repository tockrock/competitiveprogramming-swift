import XCTest
import TestLibrary

let cases: [TestCase] = [
(#filePath, #line,
"""
3
2 3
1 1
4 1
RRL
""", """
Yes
"""),
(#filePath, #line,
"""
2
1 1
2 1
RR
""", """
No
"""),
(#filePath, #line,
"""
10
1 3
1 4
0 0
0 2
0 4
3 1
2 4
4 2
4 4
3 3
RLRRRLRLRR
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