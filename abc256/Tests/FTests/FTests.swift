import XCTest
import TestLibrary

let cases: [TestCase] = [
(#filePath, #line,
"""
3 3
1 2 3
2 3
1 2 0
2 3
""", """
15
9
"""),
(#filePath, #line,
"""
2 1
998244353 998244353
2 1
""", """
0
"""),
]

final class FTests: XCTestCase, TimeLimit {
    let timeLimit: TimeInterval = 2.0

    func testExample() throws {
        try cases.forEach(solve)
    }
}