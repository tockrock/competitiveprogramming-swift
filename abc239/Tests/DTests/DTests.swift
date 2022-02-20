import XCTest
import TestLibrary

let cases: [TestCase] = [
(#filePath, #line,
"""
2 3 3 4
""", """
Aoki
"""),
(#filePath, #line,
"""
1 100 50 60
""", """
Takahashi
"""),
(#filePath, #line,
"""
3 14 1 5
""", """
Aoki
"""),
]

final class DTests: XCTestCase, TimeLimit {
    let timeLimit: TimeInterval = 2.0

    func testExample() throws {
        try cases.forEach(solve)
    }
}
