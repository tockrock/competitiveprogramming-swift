import XCTest
import TestLibrary

let cases: [TestCase] = [
(#filePath, #line,
"""
3
10 20
20 30
40 50
""", """
10 30
40 50
"""),
(#filePath, #line,
"""
3
10 40
30 60
20 50
""", """
10 60
"""),
]

final class DTests: XCTestCase, TimeLimit {
    let timeLimit: TimeInterval = 2.0

    func testExample() throws {
        try cases.forEach(solve)
    }
}