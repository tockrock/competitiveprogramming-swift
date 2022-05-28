import XCTest
import TestLibrary

let cases: [TestCase] = [
(#filePath, #line,
"""
5 3 2
""", """
Yes
"""),
(#filePath, #line,
"""
2 5 3
""", """
No
"""),
(#filePath, #line,
"""
100 100 100
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