import XCTest
import TestLibrary

let cases: [TestCase] = [
(#filePath, #line,
"""
5
3 2 3 2 2
""", """
1
2
3
4
3
"""),
(#filePath, #line,
"""
10
2 3 2 3 3 3 2 3 3 2
""", """
1
2
3
4
5
3
2
3
1
0
"""),
]

final class DTests: XCTestCase, TimeLimit {
    let timeLimit: TimeInterval = 2.0

    func testExample() throws {
        try cases.forEach(solve)
    }
}