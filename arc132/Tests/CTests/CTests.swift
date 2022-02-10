import XCTest
import TestLibrary

let cases: [TestCase] = [
(#filePath, #line,
"""
4 2
3 -1 1 -1
""", """
2
"""),
(#filePath, #line,
"""
5 1
2 3 4 5 -1
""", """
0
"""),
(#filePath, #line,
"""
16 5
-1 -1 -1 -1 -1 -1 -1 -1 -1 -1 -1 -1 -1 -1 -1 -1
""", """
794673086
"""),
]

final class CTests: XCTestCase, TimeLimit {
    let timeLimit: TimeInterval = 2.0

    func testExample() throws {
        try cases.forEach(solve)
    }
}