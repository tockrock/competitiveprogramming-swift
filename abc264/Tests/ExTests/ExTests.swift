import XCTest
import TestLibrary

let cases: [TestCase] = [
(#filePath, #line,
"""
10
1 1 2 1 2 5 5 5 1
""", """
1
1
2
2
4
4
4
5
7
10
"""),
(#filePath, #line,
"""
1
""", """
1
"""),
(#filePath, #line,
"""
10
1 2 3 4 5 6 7 8 9
""", """
1
1
1
1
1
1
1
1
1
1
"""),
(#filePath, #line,
"""
13
1 1 1 2 2 2 3 3 3 4 4 4
""", """
1
1
2
4
4
4
4
4
7
13
13
19
31
"""),
]

final class ExTests: XCTestCase, TimeLimit {
    let timeLimit: TimeInterval = 3.0

    func testExample() throws {
        try cases.forEach(solve)
    }
}