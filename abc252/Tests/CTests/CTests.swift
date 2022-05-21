import XCTest
import TestLibrary

let cases: [TestCase] = [
(#filePath, #line,
"""
3
1937458062
8124690357
2385760149
""", """
6
"""),
(#filePath, #line,
"""
5
0123456789
0123456789
0123456789
0123456789
0123456789
""", """
40
"""),
]

final class CTests: XCTestCase, TimeLimit {
    let timeLimit: TimeInterval = 2.0

    func testExample() throws {
        try cases.forEach(solve)
    }
}