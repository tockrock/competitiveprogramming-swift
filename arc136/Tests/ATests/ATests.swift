import XCTest
import TestLibrary

let cases: [TestCase] = [
(#filePath, #line,
"""
4
CBAA
""", """
CAAB
"""),
(#filePath, #line,
"""
1
A
""", """
A
"""),
(#filePath, #line,
"""
6
BBBCBB
""", """
ABCA
"""),
]

final class ATests: XCTestCase, TimeLimit {
    let timeLimit: TimeInterval = 2.0

    func testExample() throws {
        try cases.forEach(solve)
    }
}
