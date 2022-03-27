import XCTest
import TestLibrary

let cases: [TestCase] = [
(#filePath, #line,
"""
5 4
9 8 3 7 2
1 6 2 9 5
""", """
Yes
"""),
(#filePath, #line,
"""
4 90
1 1 1 100
1 2 3 100
""", """
No
"""),
(#filePath, #line,
"""
4 1000000000
1 1 1000000000 1000000000
1 1000000000 1 1000000000
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
