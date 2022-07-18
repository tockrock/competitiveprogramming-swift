import XCTest
import TestLibrary

let cases: [TestCase] = [
(#filePath, #line,
"""
1 3
""", """
C
"""),
(#filePath, #line,
"""
2 12
""", """
F
"""),
(#filePath, #line,
"""
2 11
""", """
F
"""),
]

final class ATests: XCTestCase, TimeLimit {
    let timeLimit: TimeInterval = 2.0

    func testExample() throws {
        try cases.forEach(solve)
    }
}
