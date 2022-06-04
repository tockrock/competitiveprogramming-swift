import XCTest
import TestLibrary

let cases: [TestCase] = [
(#filePath, #line,
"""
4
""", """
6
"""),
(#filePath, #line,
"""
254
""", """
896
"""),
]

final class DTests: XCTestCase, TimeLimit {
    let timeLimit: TimeInterval = 2.0

    func testExample() throws {
        try cases.forEach(solve)
    }
}