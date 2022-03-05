import XCTest
import TestLibrary

let cases: [TestCase] = [
(#filePath, #line,
"""
10
1 2 3 2 3 1 3 1 2 3
6
6 10
5 8
3 6
4 4
1 6
1 10
""", """
2
2
1
0
3
4
"""),
]

final class GTests: XCTestCase, TimeLimit {
    let timeLimit: TimeInterval = 5.0

    func testExample() throws {
        try cases.forEach(solve)
    }
}