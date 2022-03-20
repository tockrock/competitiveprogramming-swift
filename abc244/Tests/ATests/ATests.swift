import XCTest
import TestLibrary

let cases: [TestCase] = [
(#filePath, #line,
"""
5
abcde
""", """
e
"""),
(#filePath, #line,
"""
1
a
""", """
a
"""),
]

final class ATests: XCTestCase, TimeLimit {
    let timeLimit: TimeInterval = 2.0

    func testExample() throws {
        try cases.forEach(solve)
    }
}