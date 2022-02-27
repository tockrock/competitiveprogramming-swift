import XCTest
import TestLibrary

let cases: [TestCase] = [
(#filePath, #line,
"""
1 2
01
0
""", """
3
"""),
(#filePath, #line,
"""
3 3
000
100
110
0 1 2
""", """
0
"""),
(#filePath, #line,
"""
2 2
00
01
1 0
""", """
332748127
"""),
(#filePath, #line,
"""
5 4
1101
0000
0010
0100
1111
1 3 3 2 1
""", """
647836743
"""),
]

final class FTests: XCTestCase, TimeLimit {
    let timeLimit: TimeInterval = 2.0

    func testExample() throws {
        try cases.forEach(solve)
    }
}