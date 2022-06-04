import XCTest
import TestLibrary

let cases: [TestCase] = [
(#filePath, #line,
"""
254
""", """
54
"""),
(#filePath, #line,
"""
101
""", """
01
"""),
]

final class ATests: XCTestCase, TimeLimit {
    let timeLimit: TimeInterval = 2.0

    func testExample() throws {
        try cases.forEach(solve)
    }
}