import XCTest
import TestLibrary

let cases: [TestCase] = [
(#filePath, #line,
"""
abc
""", """
abcabc
"""),
(#filePath, #line,
"""
zz
""", """
zzzzzz
"""),
]

final class ATests: XCTestCase, TimeLimit {
    let timeLimit: TimeInterval = 2.0

    func testExample() throws {
        try cases.forEach(solve)
    }
}