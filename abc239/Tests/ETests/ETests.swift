import XCTest
import TestLibrary

let cases: [TestCase] = [
(#filePath, #line,
"""
5 2
1 2 3 4 5
1 4
2 1
2 5
3 2
1 2
2 1
""", """
4
5
"""),
(#filePath, #line,
"""
6 2
10 10 10 9 8 8
1 4
2 1
2 5
3 2
6 4
1 4
2 2
""", """
9
10
"""),
(#filePath, #line,
"""
4 4
1 10 100 1000
1 2
2 3
3 4
1 4
2 3
3 2
4 1
""", """
1
10
100
1000
"""),
]

final class ETests: XCTestCase, TimeLimit {
    let timeLimit: TimeInterval = 2.0

    func testExample() throws {
        try cases.forEach(solve)
    }
}