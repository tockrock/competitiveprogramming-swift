import XCTest
import TestLibrary

let cases: [TestCase] = [
(#filePath, #line,
"""
4
SSRS
""", """
2 -1
"""),
(#filePath, #line,
"""
20
SRSRSSRSSSRSRRRRRSRR
""", """
0 1
"""),
]

final class BTests: XCTestCase, TimeLimit {
    let timeLimit: TimeInterval = 2.0

    func testExample() throws {
        try cases.forEach(solve)
    }
}