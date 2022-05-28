import XCTest
import TestLibrary

let cases: [TestCase] = [
(#filePath, #line,
"""
2 3 1
""", """
6
"""),
(#filePath, #line,
"""
3 3 2
""", """
2
"""),
(#filePath, #line,
"""
100 1000 500
""", """
657064711
"""),
]

final class ETests: XCTestCase, TimeLimit {
    let timeLimit: TimeInterval = 2.0

    func testExample() throws {
        try cases.forEach(solve)
    }
}