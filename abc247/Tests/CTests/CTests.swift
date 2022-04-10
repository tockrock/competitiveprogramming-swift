import XCTest
import TestLibrary

let cases: [TestCase] = [
(#filePath, #line,
"""
2
""", """
1 2 1
"""),
(#filePath, #line,
"""
1
""", """
1
"""),
(#filePath, #line,
"""
4
""", """
1 2 1 3 1 2 1 4 1 2 1 3 1 2 1
"""),
]

final class CTests: XCTestCase, TimeLimit {
    let timeLimit: TimeInterval = 2.0

    func testExample() throws {
        try cases.forEach(solve)
    }
}