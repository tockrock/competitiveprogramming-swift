import XCTest
import TestLibrary

let cases: [TestCase] = [
(#filePath, #line,
"""
5 5
1 2
2 3
3 4
4 2
4 5
""", """
4
"""),
(#filePath, #line,
"""
3 2
1 2
2 1
""", """
2
"""),
]

final class FTests: XCTestCase, TimeLimit {
    let timeLimit: TimeInterval = 2.0

    func testExample() throws {
        try cases.forEach(solve)
    }
}