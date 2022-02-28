import XCTest
import TestLibrary

let cases: [TestCase] = [
(#filePath, #line,
"""
4 2
2 1
2 3
""", """
2 4
"""),
(#filePath, #line,
"""
3 3
1 2
2 3
3 1
""", """

"""),
(#filePath, #line,
"""
7 9
6 5
1 2
3 4
5 3
6 2
1 5
3 2
6 4
1 4
""", """
1 3 6 7
"""),
]

final class GTests: XCTestCase, TimeLimit {
    let timeLimit: TimeInterval = 2.0

    func testExample() throws {
        try cases.forEach(solve)
    }
}