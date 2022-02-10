import XCTest
import TestLibrary

let cases: [TestCase] = [
(#filePath, #line,
"""
2 3
10110
01101
""", """
2
"""),
(#filePath, #line,
"""
4 2
000011
110000
""", """
4
"""),
(#filePath, #line,
"""
12 26
01110111101110111101001101111010110110
10011110111011011001111011111101001110
""", """
22
"""),
]

final class DTests: XCTestCase, TimeLimit {
    let timeLimit: TimeInterval = 2.0

    func testExample() throws {
        try cases.forEach(solve)
    }
}