import XCTest
import TestLibrary

let cases: [TestCase] = [
(#filePath, #line,
"""
1011
""", """
0101
"""),
(#filePath, #line,
"""
0000
""", """
0000
"""),
(#filePath, #line,
"""
1111
""", """
0111
"""),
]

final class ATests: XCTestCase, TimeLimit {
    let timeLimit: TimeInterval = 2.0

    func testExample() throws {
        try cases.forEach(solve)
    }
}