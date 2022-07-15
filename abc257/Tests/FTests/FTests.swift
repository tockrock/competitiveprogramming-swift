import XCTest
import TestLibrary

let cases: [TestCase] = [
(#filePath, #line,
"""
3 2
0 2
1 2
""", """
-1 -1 2
"""),
(#filePath, #line,
"""
5 5
1 2
1 3
3 4
4 5
0 2
""", """
3 3 3 3 2
"""),
]

final class FTests: XCTestCase, TimeLimit {
    let timeLimit: TimeInterval = 2.0

    func testExample() throws {
        try cases.forEach(solve)
    }
}