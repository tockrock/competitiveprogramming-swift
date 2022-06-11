import XCTest
import TestLibrary

let cases: [TestCase] = [
(#filePath, #line,
"""
4 2
2 3
0 0
0 1
1 2
2 0
""", """
2.23606797749978969
"""),
(#filePath, #line,
"""
2 1
2
-100000 -100000
100000 100000
""", """
282842.712474619009
"""),
(#filePath, #line,
"""
8 3
2 6 8
-17683 17993
93038 47074
58079 -57520
-41515 -89802
-72739 68805
24324 -73073
71049 72103
47863 19268
""", """
130379.280458974768
"""),
]

final class BTests: XCTestCase, TimeLimit {
    let timeLimit: TimeInterval = 2.0

    func testExample() throws {
        try cases.forEach(solve)
    }
}