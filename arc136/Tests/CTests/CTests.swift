import XCTest
import TestLibrary

let cases: [TestCase] = [
(#filePath, #line,
"""
4
1 2 1 2
""", """
2
"""),
(#filePath, #line,
"""
5
3 1 4 1 5
""", """
7
"""),
(#filePath, #line,
"""
1
1000000000
""", """
1000000000
"""),
]

final class CTests: XCTestCase, TimeLimit {
    let timeLimit: TimeInterval = 2.0

    func testExample() throws {
        try cases.forEach(solve)
    }
}