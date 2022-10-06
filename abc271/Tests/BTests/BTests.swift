import XCTest
import TestLibrary

let cases: [TestCase] = [
(#filePath, #line,
"""
2 2
3 1 4 7
2 5 9
1 3
2 1
""", """
7
5
"""),
(#filePath, #line,
"""
3 4
4 128 741 239 901
2 1 1
3 314 159 26535
1 1
2 2
3 3
1 4
""", """
128
1
26535
901
"""),
]

final class BTests: XCTestCase, TimeLimit {
    let timeLimit: TimeInterval = 2.0

    func testExample() throws {
        try cases.forEach(solve)
    }
}