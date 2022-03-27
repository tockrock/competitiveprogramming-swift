import XCTest
import TestLibrary

let cases: [TestCase] = [
(#filePath, #line,
"""
4 4 2 2
1 1 2 2
2 3
1 2 15
2 3 30
3 4 40
1 4 10
""", """
45 30 30 25
"""),
(#filePath, #line,
"""
3 1 3 1
1 2 3
1
1 2 1000000000
""", """
-1 1000000000 -1
"""),
]

final class GTests: XCTestCase, TimeLimit {
    let timeLimit: TimeInterval = 2.0

    func testExample() throws {
        try cases.forEach(solve)
    }
}