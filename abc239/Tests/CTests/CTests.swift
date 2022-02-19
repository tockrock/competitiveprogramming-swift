import XCTest
import TestLibrary

let cases: [TestCase] = [
(#filePath, #line,
"""
0 0 3 3
""", """
Yes
"""),
(#filePath, #line,
"""
0 1 2 3
""", """
No
"""),
(#filePath, #line,
"""
1000000000 1000000000 999999999 999999999
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