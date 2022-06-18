import XCTest
import TestLibrary

let cases: [TestCase] = [
(#filePath, #line,
"""
3
""", """
8
"""),
(#filePath, #line,
"""
30
""", """
1073741824
"""),
]

final class ATests: XCTestCase, TimeLimit {
    let timeLimit: TimeInterval = 2.0

    func testExample() throws {
        try cases.forEach(solve)
    }
}