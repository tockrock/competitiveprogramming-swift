import XCTest
import TestLibrary

let cases: [TestCase] = [
(#filePath, #line,
"""
2
2 4
""", """
Alice
"""),
(#filePath, #line,
"""
3
0 1 2
""", """
Bob
"""),
]

final class CTests: XCTestCase, TimeLimit {
    let timeLimit: TimeInterval = 2.0

    func testExample() throws {
        try cases.forEach(solve)
    }
}