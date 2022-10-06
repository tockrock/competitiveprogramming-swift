import XCTest
import TestLibrary

let cases: [TestCase] = [
(#filePath, #line,
"""
1 50 50
ATATATATATATATATATATATAT
""", """
665496236
"""),
(#filePath, #line,
"""
271 95 1
TTTTTTTTTTTTTTTTTTTTTTTT
""", """
0
"""),
(#filePath, #line,
"""
10000000000000000 62 20
ATAATTATATTTAAAATATTATAT
""", """
744124544
"""),
]

final class GTests: XCTestCase, TimeLimit {
    let timeLimit: TimeInterval = 2.0

    func testExample() throws {
        try cases.forEach(solve)
    }
}