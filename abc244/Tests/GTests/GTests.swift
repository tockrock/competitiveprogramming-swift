import XCTest
import TestLibrary

let cases: [TestCase] = [
(#filePath, #line,
"""
6 6
6 3
2 5
4 2
1 3
6 5
3 2
110001
""", """
9
2 5 6 5 6 3 1 3 6
"""),
(#filePath, #line,
"""
3 3
3 1
3 2
1 2
000
""", """
0
"""),
]

final class GTests: XCTestCase, TimeLimit {
    let timeLimit: TimeInterval = 2.0

    func testExample() throws {
        try cases.forEach(solve)
    }
}