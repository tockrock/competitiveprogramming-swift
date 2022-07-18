import XCTest
import TestLibrary

let cases: [TestCase] = [
(#filePath, #line,
"""
5 3 5
1 3 4
3 3 1 1 2
""", """
2 4 5
"""),
(#filePath, #line,
"""
2 2 2
1 2
1 2
""", """
1 2
"""),
(#filePath, #line,
"""
10 6 9
1 3 5 7 8 9
1 2 3 4 5 6 5 6 2
""", """
2 5 6 7 9 10
"""),
]

final class BTests: XCTestCase, TimeLimit {
    let timeLimit: TimeInterval = 2.0

    func testExample() throws {
        try cases.forEach(solve)
    }
}
