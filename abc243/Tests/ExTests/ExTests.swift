import XCTest
import TestLibrary

let cases: [TestCase] = [
(#filePath, #line,
"""
4 3
S..
O..
..O
..G
""", """
Yes
3 6
"""),
(#filePath, #line,
"""
3 2
.G
.O
.S
""", """
No
"""),
(#filePath, #line,
"""
2 2
S.
.G
""", """
Yes
2 1
"""),
(#filePath, #line,
"""
10 10
OOO...OOO.
.....OOO.O
OOO.OO.OOO
OOO..O..S.
....O.O.O.
.OO.O.OOOO
..OOOG.O.O
.O.O..OOOO
.O.O.OO...
...O..O..O
""", """
Yes
10 12
"""),
]

final class ExTests: XCTestCase, TimeLimit {
    let timeLimit: TimeInterval = 4.0

    func testExample() throws {
        try cases.forEach(solve)
    }
}