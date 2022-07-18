import XCTest
import TestLibrary

let cases: [TestCase] = [
(#filePath, #line,
"""
3 2
""", """
10
"""),
(#filePath, #line,
"""
299792458 3141
""", """
138897974
"""),
]

final class GTests: XCTestCase, TimeLimit {
    let timeLimit: TimeInterval = 2.0

    func testExample() throws {
        try cases.forEach(solve)
    }
}