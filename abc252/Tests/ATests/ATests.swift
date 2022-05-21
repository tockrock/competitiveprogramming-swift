import XCTest
import TestLibrary

let cases: [TestCase] = [
(#filePath, #line,
"""
97
""", """
a
"""),
(#filePath, #line,
"""
122
""", """
z
"""),
]

final class ATests: XCTestCase, TimeLimit {
    let timeLimit: TimeInterval = 2.0

    func testExample() throws {
        try cases.forEach(solve)
    }
}