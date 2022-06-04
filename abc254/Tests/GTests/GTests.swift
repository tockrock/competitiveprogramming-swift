import XCTest
import TestLibrary

let cases: [TestCase] = [
(#filePath, #line,
"""
3 4 3
1 2 10
2 3 7
3 9 14
3 1 3
1 3 3 14
3 1 2 7
1 100 1 101
""", """
12
7
-1
"""),
(#filePath, #line,
"""
1 1 1
1 1 2
1 1 1 2
""", """
1
"""),
]

final class GTests: XCTestCase, TimeLimit {
    let timeLimit: TimeInterval = 6.0

    func testExample() throws {
        try cases.forEach(solve)
    }
}