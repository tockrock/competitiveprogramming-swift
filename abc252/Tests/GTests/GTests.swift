import XCTest
import TestLibrary

let cases: [TestCase] = [
(#filePath, #line,
"""
4
1 2 4 3
""", """
3
"""),
(#filePath, #line,
"""
8
1 2 3 5 6 7 8 4
""", """
202
"""),
]

final class GTests: XCTestCase, TimeLimit {
    let timeLimit: TimeInterval = 2.0

    func testExample() throws {
        try cases.forEach(solve)
    }
}