import XCTest
import TestLibrary

let cases: [TestCase] = [
(#filePath, #line,
"""
5 5
1 2
2 3
3 5
2 4
4 5
0 8 3 4 0
""", """
7
2
3 4
"""),
(#filePath, #line,
"""
3 2
1 2
2 3
0 1 0
""", """
1
1
2
"""),
(#filePath, #line,
"""
5 9
1 2
1 3
1 4
2 3
2 4
2 5
3 4
3 5
4 5
0 1000000000 1000000000 1000000000 0
""", """
3000000000
3
2 3 4
"""),
]

final class GTests: XCTestCase, TimeLimit {
    let timeLimit: TimeInterval = 2.0

    func testExample() throws {
        try cases.forEach(solve)
    }
}