import XCTest
import TestLibrary

let cases: [TestCase] = [
(#filePath, #line,
"""
3 5
2 5 6
3 1 3
1 2 3 2
3 1 2
2 1 2 3
3 1 3
""", """
13
4
9
"""),
(#filePath, #line,
"""
6 11
10 3 5 20 6 7
3 1 6
1 2 4 3
3 1 3
2 1 4 10
3 3 6
1 3 6 2
2 1 4 5
3 1 6
2 1 3 100
1 2 5 6
3 1 4
""", """
51
12
33
26
132
"""),
]

final class ExTests: XCTestCase, TimeLimit {
    let timeLimit: TimeInterval = 8.0

    func testExample() throws {
        try cases.forEach(solve)
    }
}