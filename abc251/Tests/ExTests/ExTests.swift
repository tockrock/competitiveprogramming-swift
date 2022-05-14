import XCTest
import TestLibrary

let cases: [TestCase] = [
(#filePath, #line,
"""
6 3 4
2 3
5 2
1 1
""", """
1 4 3 2
"""),
(#filePath, #line,
"""
1 1 1
6 1
""", """
6
"""),
(#filePath, #line,
"""
111111111 9 9
0 1
1 10
2 100
3 1000
4 10000
5 100000
6 1000000
0 10000000
1 100000000
""", """
1 0 4 2 5 5 5 6 3
"""),
]

final class ExTests: XCTestCase, TimeLimit {
    let timeLimit: TimeInterval = 4.0

    func testExample() throws {
        try cases.forEach(solve)
    }
}