import XCTest
import TestLibrary

let cases: [TestCase] = [
(#filePath, #line,
"""
2 3
2 4
3 2
8 1 5
2 10 5
""", """
Yes
"""),
(#filePath, #line,
"""
2 2
1 1
2 2
100 1
100 1
""", """
No
"""),
(#filePath, #line,
"""
1 1
10
100
100
10
""", """
No
"""),
(#filePath, #line,
"""
1 1
10
100
10
100
""", """
Yes
"""),
]

final class ETests: XCTestCase, TimeLimit {
    let timeLimit: TimeInterval = 4.0

    func testExample() throws {
        try cases.forEach(solve)
    }
}