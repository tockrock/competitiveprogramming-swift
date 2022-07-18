import XCTest
import TestLibrary

let cases: [TestCase] = [
(#filePath, #line,
"""
6
1 3 5 6 4 2
3 5 1 4 6 2
""", """
3 6
0 0
0 5
0 0
0 0
4 2
"""),
(#filePath, #line,
"""
2
2 1
1 2
""", """
-1
"""),
]

final class FTests: XCTestCase, TimeLimit {
    let timeLimit: TimeInterval = 2.0

    func testExample() throws {
        try cases.forEach(solve)
    }
}