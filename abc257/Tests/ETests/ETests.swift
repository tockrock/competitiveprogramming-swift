import XCTest
import TestLibrary

let cases: [TestCase] = [
(#filePath, #line,
"""
5
5 4 3 3 2 5 3 5 3
""", """
95
"""),
(#filePath, #line,
"""
20
1 1 1 1 1 1 1 1 1
""", """
99999999999999999999
"""),
]

final class ETests: XCTestCase, TimeLimit {
    let timeLimit: TimeInterval = 2.0

    func testExample() throws {
        try cases.forEach(solve)
    }
}