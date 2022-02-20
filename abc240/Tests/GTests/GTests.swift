import XCTest
import TestLibrary

let cases: [TestCase] = [
(#filePath, #line,
"""
3 2 0 -1
""", """
3
"""),
(#filePath, #line,
"""
1 0 0 0
""", """
0
"""),
(#filePath, #line,
"""
314 15 92 65
""", """
106580952
"""),
]

final class GTests: XCTestCase, TimeLimit {
    let timeLimit: TimeInterval = 3.0

    func testExample() throws {
        try cases.forEach(solve)
    }
}