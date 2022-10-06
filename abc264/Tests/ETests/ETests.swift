import XCTest
import TestLibrary

let cases: [TestCase] = [
(#filePath, #line,
"""
5 5 10
2 3
4 10
5 10
6 9
2 9
4 8
1 7
3 6
8 10
1 8
6
3
5
8
10
2
7
""", """
4
4
2
2
2
1
"""),
]

final class ETests: XCTestCase, TimeLimit {
    let timeLimit: TimeInterval = 3.0

    func testExample() throws {
        try cases.forEach(solve)
    }
}