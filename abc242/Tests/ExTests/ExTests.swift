import XCTest
import TestLibrary

let cases: [TestCase] = [
(#filePath, #line,
"""
3 3
1 1
1 2
2 3
""", """
499122180
"""),
(#filePath, #line,
"""
13 10
3 5
5 9
3 12
1 13
9 11
12 13
2 4
9 12
9 11
7 11
""", """
10
"""),
(#filePath, #line,
"""
100 11
22 43
84 93
12 71
49 56
8 11
1 61
13 80
26 83
23 100
80 85
9 89
""", """
499122193
"""),
]

final class ExTests: XCTestCase, TimeLimit {
    let timeLimit: TimeInterval = 3.0

    func testExample() throws {
        try cases.forEach(solve)
    }
}