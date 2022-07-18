import XCTest
import TestLibrary

let cases: [TestCase] = [
(#filePath, #line,
"""
3
2 3 2
1 10 100
""", """
10
"""),
(#filePath, #line,
"""
8
7 3 5 5 8 4 1 2
36 49 73 38 30 85 27 45
""", """
57
"""),
]

final class ETests: XCTestCase, TimeLimit {
    let timeLimit: TimeInterval = 2.0

    func testExample() throws {
        try cases.forEach(solve)
    }
}