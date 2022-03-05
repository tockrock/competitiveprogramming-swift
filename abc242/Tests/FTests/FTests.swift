import XCTest
import TestLibrary

let cases: [TestCase] = [
(#filePath, #line,
"""
2 2 1 1
""", """
4
"""),
(#filePath, #line,
"""
1 2 1 1
""", """
0
"""),
(#filePath, #line,
"""
40 40 30 30
""", """
467620384
"""),
]

final class FTests: XCTestCase, TimeLimit {
    let timeLimit: TimeInterval = 2.0

    func testExample() throws {
        try cases.forEach(solve)
    }
}