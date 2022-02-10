import XCTest
import TestLibrary

let cases: [TestCase] = [
(#filePath, #line,
"""
5
5 2 3 4 1
4 2 3 1 5
7
1 5
5 1
1 1
2 2
3 3
4 4
5 5
""", """
#.#.#.#
"""),
]

final class ATests: XCTestCase, TimeLimit {
    let timeLimit: TimeInterval = 2.0

    func testExample() throws {
        try cases.forEach(solve)
    }
}