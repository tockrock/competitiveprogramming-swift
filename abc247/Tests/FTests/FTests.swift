import XCTest
import TestLibrary

let cases: [TestCase] = [
(#filePath, #line,
"""
3
1 2 3
2 1 3
""", """
3
"""),
(#filePath, #line,
"""
5
2 3 5 4 1
4 2 1 3 5
""", """
12
"""),
(#filePath, #line,
"""
8
1 2 3 4 5 6 7 8
1 2 3 4 5 6 7 8
""", """
1
"""),
]

final class FTests: XCTestCase, TimeLimit {
    let timeLimit: TimeInterval = 2.0

    func testExample() throws {
        try cases.forEach(solve)
    }
}