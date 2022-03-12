import XCTest
import TestLibrary

let cases: [TestCase] = [
(#filePath, #line,
"""
3 3
1 2 2
2 3 3
1 3 6
""", """
1
"""),
(#filePath, #line,
"""
5 4
1 3 3
2 3 9
3 5 3
4 5 3
""", """
0
"""),
(#filePath, #line,
"""
5 10
1 2 71
1 3 9
1 4 82
1 5 64
2 3 22
2 4 99
2 5 1
3 4 24
3 5 18
4 5 10
""", """
5
"""),
]

final class ETests: XCTestCase, TimeLimit {
    let timeLimit: TimeInterval = 2.0

    func testExample() throws {
        try cases.forEach(solve)
    }
}