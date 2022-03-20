import XCTest
import TestLibrary

let cases: [TestCase] = [
(#filePath, #line,
"""
3 2
1 2
2 3
""", """
14
"""),
(#filePath, #line,
"""
5 5
4 2
2 3
1 3
2 1
1 5
""", """
108
"""),
]

final class FTests: XCTestCase, TimeLimit {
    let timeLimit: TimeInterval = 4.0

    func testExample() throws {
        try cases.forEach(solve)
    }
}