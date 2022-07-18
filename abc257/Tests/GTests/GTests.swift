import XCTest
import TestLibrary

let cases: [TestCase] = [
(#filePath, #line,
"""
aba
ababaab
""", """
3
"""),
(#filePath, #line,
"""
atcoder
ac
""", """
-1
"""),
]

final class GTests: XCTestCase, TimeLimit {
    let timeLimit: TimeInterval = 2.0

    func testExample() throws {
        try cases.forEach(solve)
    }
}