import XCTest
import TestLibrary

let cases: [TestCase] = [
(#filePath, #line,
"""
4 1
1 1 2 1
""", """
3
"""),
(#filePath, #line,
"""
3 3
1 1 2
""", """
1
"""),
(#filePath, #line,
"""
10 4
2 7 1 8 2 8 1 8 2 8
""", """
132
"""),
]

final class ExTests: XCTestCase, TimeLimit {
    let timeLimit: TimeInterval = 4.0

    func testExample() throws {
        try cases.forEach(solve)
    }
}