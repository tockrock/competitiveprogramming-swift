import XCTest
import TestLibrary

let cases: [TestCase] = [
(#filePath, #line,
"""
7 0 6 30
""", """
Aoki
"""),
(#filePath, #line,
"""
7 30 7 30
""", """
Takahashi
"""),
(#filePath, #line,
"""
0 0 23 59
""", """
Takahashi
"""),
]

final class ATests: XCTestCase, TimeLimit {
    let timeLimit: TimeInterval = 2.0

    func testExample() throws {
        try cases.forEach(solve)
    }
}