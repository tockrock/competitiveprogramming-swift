import XCTest
import TestLibrary

let cases: [TestCase] = [
(#filePath, #line,
"""
8
........
........
.#.##.#.
........
........
........
........
........
""", """
Yes
"""),
(#filePath, #line,
"""
6
######
######
######
######
######
######
""", """
Yes
"""),
(#filePath, #line,
"""
10
..........
#..##.....
..........
..........
....#.....
....#.....
.#...#..#.
..........
..........
..........
""", """
No
"""),
(#filePath, #line,
"""
8
....#...
.....#..
.#.#..#.
.....#.#
......#.
#......#
.#......
..#.....
""", """
Yes
"""),
]

final class CTests: XCTestCase, TimeLimit {
    let timeLimit: TimeInterval = 3.0

    func testExample() throws {
        try cases.forEach(solve)
    }
}
