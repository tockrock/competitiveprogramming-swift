import XCTest
import TestLibrary

let cases: [TestCase] = [
(#filePath, #line,
"""
3 5
3 5 2
8 1 3
1 2 2 3
1 3 1 3
1 1 1 1
2 2 2 2
3 3 1 1
""", """
2
1
11
6
10
"""),
(#filePath, #line,
"""
1 1
9
100
1 1 1 1
""", """
109
"""),
]

final class FTests: XCTestCase, TimeLimit {
    let timeLimit: TimeInterval = 2.0

    func testExample() throws {
        try cases.forEach(solve)
    }
}