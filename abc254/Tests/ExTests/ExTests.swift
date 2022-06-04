import XCTest
import TestLibrary

let cases: [TestCase] = [
(#filePath, #line,
"""
3
3 4 5
2 4 6
""", """
2
"""),
(#filePath, #line,
"""
1
0
1
""", """
-1
"""),
]

final class ExTests: XCTestCase, TimeLimit {
    let timeLimit: TimeInterval = 2.5

    func testExample() throws {
        try cases.forEach(solve)
    }
}