import XCTest
import TestLibrary

let cases: [TestCase] = [
(#filePath, #line,
"""
4 5
""", """
Yes
"""),
(#filePath, #line,
"""
3 5
""", """
No
"""),
(#filePath, #line,
"""
1 10
""", """
Yes
"""),
]

final class ATests: XCTestCase, TimeLimit {
    let timeLimit: TimeInterval = 2.0

    func testExample() throws {
        try cases.forEach(solve)
    }
}