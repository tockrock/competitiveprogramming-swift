import XCTest
import TestLibrary

let cases: [TestCase] = [
(#filePath, #line,
"""
7
0101010
""", """
3
"""),
(#filePath, #line,
"""
30
000011001110101001011110001001
""", """
9
"""),
]

final class ExTests: XCTestCase, TimeLimit {
    let timeLimit: TimeInterval = 5.0

    func testExample() throws {
        try cases.forEach(solve)
    }
}