import XCTest
import TestLibrary

let cases: [TestCase] = [
(#filePath, #line,
"""
15
""", """
192
"""),
(#filePath, #line,
"""
3
""", """
3
"""),
(#filePath, #line,
"""
100
""", """
824552442
"""),
]

final class ATests: XCTestCase, TimeLimit {
    let timeLimit: TimeInterval = 2.0

    func testExample() throws {
        try cases.forEach(solve)
    }
}