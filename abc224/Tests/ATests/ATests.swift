import XCTest
import TestLibrary

let cases: [TestCase] = [
(#filePath, #line,
"""
atcoder
""", """
er
"""),
(#filePath, #line,
"""
tourist
""", """
ist
"""),
(#filePath, #line,
"""
er
""", """
er
"""),
]

final class ATests: XCTestCase, TimeLimit {
    let timeLimit: TimeInterval = 2.0

    func testExample() throws {
        try cases.forEach(solve)
    }
}