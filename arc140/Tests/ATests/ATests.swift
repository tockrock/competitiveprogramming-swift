import XCTest
import TestLibrary

let cases: [TestCase] = [
(#filePath, #line,
"""
4 1
abac
""", """
2
"""),
(#filePath, #line,
"""
10 0
aaaaaaaaaa
""", """
1
"""),
(#filePath, #line,
"""
6 1
abcaba
""", """
3
"""),
]

final class ATests: XCTestCase, TimeLimit {
    let timeLimit: TimeInterval = 2.0

    func testExample() throws {
        try cases.forEach(solve)
    }
}
