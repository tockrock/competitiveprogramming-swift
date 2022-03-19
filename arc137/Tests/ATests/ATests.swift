import XCTest
import TestLibrary

let cases: [TestCase] = [
(#filePath, #line,
"""
2 4
""", """
1
"""),
(#filePath, #line,
"""
14 21
""", """
5
"""),
(#filePath, #line,
"""
1 100
""", """
99
"""),
]

final class ATests: XCTestCase, TimeLimit {
    let timeLimit: TimeInterval = 2.0

    func testExample() throws {
        try cases.forEach(solve)
    }
}