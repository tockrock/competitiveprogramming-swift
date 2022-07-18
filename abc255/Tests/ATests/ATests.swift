import XCTest
import TestLibrary

let cases: [TestCase] = [
(#filePath, #line,
"""
1 2
1 0
0 1
""", """
0
"""),
(#filePath, #line,
"""
2 2
1 2
3 4
""", """
4
"""),
(#filePath, #line,
"""
2 1
90 80
70 60
""", """
70
"""),
]

final class ATests: XCTestCase, TimeLimit {
    let timeLimit: TimeInterval = 2.0

    func testExample() throws {
        try cases.forEach(solve)
    }
}