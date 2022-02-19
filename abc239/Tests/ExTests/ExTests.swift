import XCTest
import TestLibrary

let cases: [TestCase] = [
(#filePath, #line,
"""
2 1
""", """
2
"""),
(#filePath, #line,
"""
2 39
""", """
12
"""),
(#filePath, #line,
"""
3 2
""", """
250000004
"""),
(#filePath, #line,
"""
2392 39239
""", """
984914531
"""),
(#filePath, #line,
"""
1000000000 1000000000
""", """
776759630
"""),
]

final class ExTests: XCTestCase, TimeLimit {
    let timeLimit: TimeInterval = 2.0

    func testExample() throws {
        try cases.forEach(solve)
    }
}