import XCTest
import TestLibrary

let cases: [TestCase] = [
(#filePath, #line,
"""
47
""", """
4
"""),
(#filePath, #line,
"""
-24
""", """
-3
"""),
(#filePath, #line,
"""
50
""", """
5
"""),
(#filePath, #line,
"""
-30
""", """
-3
"""),
(#filePath, #line,
"""
987654321987654321
""", """
98765432198765432
"""),
]

final class BTests: XCTestCase, TimeLimit {
    let timeLimit: TimeInterval = 2.0

    func testExample() throws {
        try cases.forEach(solve)
    }
}