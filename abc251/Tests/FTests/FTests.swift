import XCTest
import TestLibrary

let cases: [TestCase] = [
(#filePath, #line,
"""
6 8
5 1
4 3
1 4
3 5
1 2
2 6
1 6
4 2
""", """
1 4
4 3
5 3
4 2
6 2
1 5
5 3
1 4
2 1
1 6
"""),
(#filePath, #line,
"""
4 3
3 1
1 2
1 4
""", """
1 2
1 3
1 4
1 4
1 3
1 2
"""),
]

final class FTests: XCTestCase, TimeLimit {
    let timeLimit: TimeInterval = 2.0

    func testExample() throws {
        try cases.forEach(solve)
    }
}