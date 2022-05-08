import XCTest
import TestLibrary

let cases: [TestCase] = [
(#filePath, #line,
"""
6 6 3
1 4 1
4 6 4
2 5 2
3 5 3
5 6 5
1 2 15
3
2 3 4
2 3 5
1 3 12
""", """
No
Yes
Yes
"""),
]

final class ExTests: XCTestCase, TimeLimit {
    let timeLimit: TimeInterval = 7.0

    func testExample() throws {
        try cases.forEach(solve)
    }
}