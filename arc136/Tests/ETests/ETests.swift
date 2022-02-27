import XCTest
import TestLibrary

let cases: [TestCase] = [
(#filePath, #line,
"""
6
1 1 1 1 1 1
""", """
4
"""),
(#filePath, #line,
"""
6
1 2 1 3 1 6
""", """
8
"""),
(#filePath, #line,
"""
20
40 39 31 54 27 31 80 3 62 66 15 72 21 38 74 49 15 24 44 3
""", """
343
"""),
]

final class ETests: XCTestCase, TimeLimit {
    let timeLimit: TimeInterval = 2.0

    func testExample() throws {
        try cases.forEach(solve)
    }
}