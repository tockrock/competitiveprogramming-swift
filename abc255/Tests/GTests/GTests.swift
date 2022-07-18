import XCTest
import TestLibrary

let cases: [TestCase] = [
(#filePath, #line,
"""
3 4
1 2 4
2 1
3 3
3 1
1 1
""", """
Takahashi
"""),
(#filePath, #line,
"""
1 5
5
5 1
5 2
5 3
5 4
5 5
""", """
Aoki
"""),
]

final class GTests: XCTestCase, TimeLimit {
    let timeLimit: TimeInterval = 4.0

    func testExample() throws {
        try cases.forEach(solve)
    }
}