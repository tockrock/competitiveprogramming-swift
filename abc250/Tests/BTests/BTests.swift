import XCTest
import TestLibrary

let cases: [TestCase] = [
(#filePath, #line,
"""
4 3 2
""", """
..##..##
..##..##
..##..##
##..##..
##..##..
##..##..
..##..##
..##..##
..##..##
##..##..
##..##..
##..##..
"""),
(#filePath, #line,
"""
5 1 5
""", """
.....#####.....#####.....
#####.....#####.....#####
.....#####.....#####.....
#####.....#####.....#####
.....#####.....#####.....
"""),
(#filePath, #line,
"""
4 4 1
""", """
.#.#
.#.#
.#.#
.#.#
#.#.
#.#.
#.#.
#.#.
.#.#
.#.#
.#.#
.#.#
#.#.
#.#.
#.#.
#.#.
"""),
(#filePath, #line,
"""
1 4 4
""", """
....
....
....
....
"""),
]

final class BTests: XCTestCase, TimeLimit {
    let timeLimit: TimeInterval = 2.0

    func testExample() throws {
        try cases.forEach(solve)
    }
}
