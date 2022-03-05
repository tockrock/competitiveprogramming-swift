import XCTest
import TestLibrary

let cases: [TestCase] = [
(#filePath, #line,
"""
aba
""", """
aab
"""),
(#filePath, #line,
"""
zzzz
""", """
zzzz
"""),
]

final class BTests: XCTestCase, TimeLimit {
    let timeLimit: TimeInterval = 2.0

    func testExample() throws {
        try cases.forEach(solve)
    }
}