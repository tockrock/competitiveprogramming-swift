import XCTest
import TestLibrary

let cases: [TestCase] = [
(#filePath, #line,
"""
99
""", """
63
"""),
(#filePath, #line,
"""
12
""", """
0C
"""),
(#filePath, #line,
"""
0
""", """
00
"""),
(#filePath, #line,
"""
255
""", """
FF
"""),
]

final class ATests: XCTestCase, TimeLimit {
    let timeLimit: TimeInterval = 2.0

    func testExample() throws {
        try cases.forEach(solve)
    }
}