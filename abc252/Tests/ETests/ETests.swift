import XCTest
import TestLibrary

let cases: [TestCase] = [
(#filePath, #line,
"""
3 3
1 2 1
2 3 2
1 3 10
""", """
1 2
"""),
(#filePath, #line,
"""
4 6
1 2 1
1 3 1
1 4 1
2 3 1
2 4 1
3 4 1
""", """
3 1 2
"""),
]

final class ETests: XCTestCase, TimeLimit {
    let timeLimit: TimeInterval = 2.0

    func testExample() throws {
        try cases.forEach(solve)
    }
}