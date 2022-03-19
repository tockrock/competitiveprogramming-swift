import XCTest
import TestLibrary

let cases: [TestCase] = [
(#filePath, #line,
"""
2 1
""", """
332748118
"""),
(#filePath, #line,
"""
5 3
""", """
66549624
"""),
(#filePath, #line,
"""
10000 5000
""", """
642557092
"""),
]

final class FTests: XCTestCase, TimeLimit {
    let timeLimit: TimeInterval = 6.0

    func testExample() throws {
        try cases.forEach(solve)
    }
}