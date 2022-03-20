import XCTest
import TestLibrary

let cases: [TestCase] = [
(#filePath, #line,
"""
4 4 4 1 3 2
1 2
2 3
3 4
1 4
""", """
4
"""),
(#filePath, #line,
"""
6 5 10 1 2 3
2 3
2 4
4 6
3 6
1 5
""", """
0
"""),
(#filePath, #line,
"""
10 15 20 4 4 6
2 6
2 7
5 7
4 5
2 4
3 7
1 7
1 4
2 9
5 10
1 3
7 8
7 9
1 6
1 2
""", """
952504739
"""),
]

final class ETests: XCTestCase, TimeLimit {
    let timeLimit: TimeInterval = 2.0

    func testExample() throws {
        try cases.forEach(solve)
    }
}