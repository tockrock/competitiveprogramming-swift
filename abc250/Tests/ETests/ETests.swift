import XCTest
import TestLibrary

let cases: [TestCase] = [
(#filePath, #line,
"""
5
1 2 3 4 5
1 2 2 4 3
7
1 1
2 2
2 3
3 3
4 4
4 5
5 5
""", """
Yes
Yes
Yes
No
No
Yes
No
"""),
]

final class ETests: XCTestCase, TimeLimit {
    let timeLimit: TimeInterval = 4.0

    func testExample() throws {
        try cases.forEach(solve)
    }
}