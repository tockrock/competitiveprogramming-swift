import XCTest
import TestLibrary

let cases: [TestCase] = [
(#filePath, #line,
"""
4 5
1 2 3 4 5
6 7 8 9 10
11 12 13 14 15
16 17 18 19 20
2 3
6 8 9
16 18 19
""", """
Yes
"""),
(#filePath, #line,
"""
3 3
1 1 1
1 1 1
1 1 1
1 1
2
""", """
No
"""),
]

final class CTests: XCTestCase, TimeLimit {
    let timeLimit: TimeInterval = 2.0

    func testExample() throws {
        try cases.forEach(solve)
    }
}