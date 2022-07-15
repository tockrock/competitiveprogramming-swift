import XCTest
import TestLibrary

let cases: [TestCase] = [
(#filePath, #line,
"""
5
10101
60 45 30 40 80
""", """
4
"""),
(#filePath, #line,
"""
3
000
1 2 3
""", """
3
"""),
(#filePath, #line,
"""
5
10101
60 50 50 50 60
""", """
4
"""),
]

final class CTests: XCTestCase, TimeLimit {
    let timeLimit: TimeInterval = 2.0

    func testExample() throws {
        try cases.forEach(solve)
    }
}