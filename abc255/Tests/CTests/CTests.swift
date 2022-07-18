import XCTest
import TestLibrary

let cases: [TestCase] = [
(#filePath, #line,
"""
6 2 3 3
""", """
1
"""),
(#filePath, #line,
"""
0 0 0 1
""", """
0
"""),
(#filePath, #line,
"""
998244353 -10 -20 30
""", """
998244363
"""),
(#filePath, #line,
"""
-555555555555555555 -1000000000000000000 1000000 1000000000000
""", """
444445
"""),
]

final class CTests: XCTestCase, TimeLimit {
    let timeLimit: TimeInterval = 2.0

    func testExample() throws {
        try cases.forEach(solve)
    }
}