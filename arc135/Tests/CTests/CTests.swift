import XCTest
import TestLibrary

let cases: [TestCase] = [
(#filePath, #line,
"""
5
1 2 3 4 5
""", """
19
"""),
(#filePath, #line,
"""
5
10 10 10 10 10
""", """
50
"""),
(#filePath, #line,
"""
5
3 1 4 1 5
""", """
18
"""),
]

final class CTests: XCTestCase, TimeLimit {
    let timeLimit: TimeInterval = 2.0

    func testExample() throws {
        try cases.forEach(solve)
    }
}