import XCTest
import TestLibrary

let cases: [TestCase] = [
(#filePath, #line,
"""
3 2
1 1 3
3 1
""", """
Yes
"""),
(#filePath, #line,
"""
1 1
1000000000
1
""", """
No
"""),
(#filePath, #line,
"""
5 2
1 2 3 4 5
5 5
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