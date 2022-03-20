import XCTest
import TestLibrary

let cases: [TestCase] = [
(#filePath, #line,
"""
R G B
R G B
""", """
Yes
"""),
]

final class DTests: XCTestCase, TimeLimit {
    let timeLimit: TimeInterval = 2.0

    func testExample() throws {
        try cases.forEach(solve)
    }
}