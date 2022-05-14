import XCTest
import TestLibrary

let cases: [TestCase] = [
(#filePath, #line,
"""
6
""", """
3
1 2 3
"""),
(#filePath, #line,
"""
12
""", """
6
2 5 1 2 5 1
"""),
]

final class DTests: XCTestCase, TimeLimit {
    let timeLimit: TimeInterval = 2.0

    func testExample() throws {
        try cases.forEach(solve)
    }
}