import XCTest
import TestLibrary

let cases: [TestCase] = [
(#filePath, #line,
"""
3 5
""", """
black
"""),
(#filePath, #line,
"""
4 5
""", """
white
"""),
]

final class BTests: XCTestCase, TimeLimit {
    let timeLimit: TimeInterval = 2.0

    func testExample() throws {
        try cases.forEach(solve)
    }
}