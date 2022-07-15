import XCTest
import TestLibrary

let cases: [TestCase] = [
(#filePath, #line,
"""
3 4 6 3 3 7
""", """
1
"""),
(#filePath, #line,
"""
3 4 5 6 7 8
""", """
0
"""),
(#filePath, #line,
"""
5 13 10 6 13 9
""", """
120
"""),
(#filePath, #line,
"""
20 25 30 22 29 24
""", """
30613
"""),
]

final class CTests: XCTestCase, TimeLimit {
    let timeLimit: TimeInterval = 2.0

    func testExample() throws {
        try cases.forEach(solve)
    }
}
