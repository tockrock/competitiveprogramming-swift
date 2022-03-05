import XCTest
import TestLibrary

let cases: [TestCase] = [
(#filePath, #line,
"""
4
""", """
203
"""),
(#filePath, #line,
"""
2
""", """
25
"""),
(#filePath, #line,
"""
1000000
""", """
248860093
"""),
]

final class CTests: XCTestCase, TimeLimit {
    let timeLimit: TimeInterval = 2.0

    func testExample() throws {
        try cases.forEach(solve)
    }
}