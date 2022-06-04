import XCTest
import TestLibrary

let cases: [TestCase] = [
(#filePath, #line,
"""
6 5
2 3
3 4
3 5
5 6
2 6
7
1 1
2 2
2 0
2 3
4 1
6 0
4 3
""", """
1
20
2
20
7
6
20
"""),
]

final class ETests: XCTestCase, TimeLimit {
    let timeLimit: TimeInterval = 3.5

    func testExample() throws {
        try cases.forEach(solve)
    }
}