import XCTest
import TestLibrary

let cases: [TestCase] = [
(#filePath, #line,
"""
4
1 2 3
2 2
1 3 4
2 3
""", """
4
8
"""),
(#filePath, #line,
"""
2
1 1000000000 1000000000
2 1000000000
""", """
1000000000000000000
"""),
(#filePath, #line,
"""
5
1 1 1
1 1 1
1 1 1
1 1 1
1 1 1
""", """
"""),
]

final class DTests: XCTestCase, TimeLimit {
    let timeLimit: TimeInterval = 2.0

    func testExample() throws {
        try cases.forEach(solve)
    }
}
