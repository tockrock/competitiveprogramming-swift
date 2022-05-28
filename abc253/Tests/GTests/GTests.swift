import XCTest
import TestLibrary

let cases: [TestCase] = [
(#filePath, #line,
"""
5 3 6
""", """
5 1 2 3 4
"""),
(#filePath, #line,
"""
10 12 36
""", """
1 10 9 8 7 4 3 2 5 6
"""),
]

final class GTests: XCTestCase, TimeLimit {
    let timeLimit: TimeInterval = 2.0

    func testExample() throws {
        try cases.forEach(solve)
    }
}