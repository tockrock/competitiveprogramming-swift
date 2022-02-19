import XCTest
import TestLibrary

let cases: [TestCase] = [
(#filePath, #line,
"""
10 2
""", """
25
"""),
(#filePath, #line,
"""
10 10
""", """
0
"""),
(#filePath, #line,
"""
10000 10
""", """
862816
"""),
]

final class FTests: XCTestCase, TimeLimit {
    let timeLimit: TimeInterval = 2.0

    func testExample() throws {
        try cases.forEach(solve)
    }
}