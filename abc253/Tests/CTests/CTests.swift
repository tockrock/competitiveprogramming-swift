import XCTest
import TestLibrary

let cases: [TestCase] = [
(#filePath, #line,
"""
8
1 3
1 2
3
1 2
1 7
3
2 2 3
3
""", """
1
5
4
"""),
(#filePath, #line,
"""
4
1 10000
1 1000
2 100 3
1 10
""", """

"""),
]

final class CTests: XCTestCase, TimeLimit {
    let timeLimit: TimeInterval = 2.0

    func testExample() throws {
        try cases.forEach(solve)
    }
}