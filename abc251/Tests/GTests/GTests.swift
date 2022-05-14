import XCTest
import TestLibrary

let cases: [TestCase] = [
(#filePath, #line,
"""
5
-2 -3
0 -2
1 0
0 2
-2 1
2
0 1
1 0
6
0 0
1 0
0 1
1 1
-1 -1
-1 -2
""", """
Yes
No
Yes
Yes
Yes
No
"""),
(#filePath, #line,
"""
10
45 100
-60 98
-95 62
-95 28
-78 -41
-54 -92
-8 -99
87 -94
98 23
87 91
5
-57 -40
-21 -67
25 39
-30 25
39 -20
16
4 5
-34 -8
-63 53
78 84
19 -16
64 9
-13 7
13 53
-20 4
2 -7
3 18
-12 10
-69 -93
2 9
27 64
-92 -100
""", """
Yes
Yes
No
No
Yes
No
Yes
No
Yes
Yes
Yes
Yes
No
Yes
No
No
"""),
]

final class GTests: XCTestCase, TimeLimit {
    let timeLimit: TimeInterval = 2.0

    func testExample() throws {
        try cases.forEach(solve)
    }
}