import XCTest
import TestLibrary

let cases: [TestCase] = [
(#filePath, #line,
"""
3 4
2 2
""", """
4
"""),
(#filePath, #line,
"""
3 4
1 3
""", """
3
"""),
(#filePath, #line,
"""
3 4
3 4
""", """
2
"""),
(#filePath, #line,
"""
1 10
1 5
""", """
2
"""),
(#filePath, #line,
"""
8 1
8 1
""", """
1
"""),
(#filePath, #line,
"""
1 1
1 1
""", """
0
"""),
]

final class ATests: XCTestCase, TimeLimit {
    let timeLimit: TimeInterval = 2.0

    func testExample() throws {
        try cases.forEach(solve)
    }
}
