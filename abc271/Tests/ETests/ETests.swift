import XCTest
import TestLibrary

let cases: [TestCase] = [
(#filePath, #line,
"""
3 4 4
1 2 2
2 3 2
1 3 3
1 3 5
4 2 1 2
""", """
4
"""),
(#filePath, #line,
"""
3 2 3
1 2 1
2 3 1
2 1 1
""", """
-1
"""),
(#filePath, #line,
"""
4 4 5
3 2 2
1 3 5
2 4 7
3 4 10
2 4 1 4 3
""", """
14
"""),
]

final class ETests: XCTestCase, TimeLimit {
    let timeLimit: TimeInterval = 2.0

    func testExample() throws {
        try cases.forEach(solve)
    }
}