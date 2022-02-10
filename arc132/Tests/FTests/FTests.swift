import XCTest
import TestLibrary

let cases: [TestCase] = [
(#filePath, #line,
"""
2 1 3
RS
RP
RR
RS
""", """
3
3
3
0
1
0
0
1
0
"""),
(#filePath, #line,
"""
3 5 4
RRP
SSS
RSR
PPP
RSS
PPS
SRP
SSP
RRS
""", """
4
7
7
6
9
10
4
7
8
4
8
7
4
8
8
3
7
7
3
7
6
4
8
8
1
5
5
"""),
]

final class FTests: XCTestCase, TimeLimit {
    let timeLimit: TimeInterval = 5.0

    func testExample() throws {
        try cases.forEach(solve)
    }
}