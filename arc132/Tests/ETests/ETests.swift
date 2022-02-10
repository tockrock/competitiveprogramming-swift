import XCTest
import TestLibrary

let cases: [TestCase] = [
(#filePath, #line,
"""
5
><.<<
""", """
3
"""),
(#filePath, #line,
"""
20
>.>.<>.<<.<>.<..<>><
""", """
848117770
"""),
]

final class ETests: XCTestCase, TimeLimit {
    let timeLimit: TimeInterval = 2.0

    func testExample() throws {
        try cases.forEach(solve)
    }
}