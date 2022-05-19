import XCTest
import TestLibrary

let cases: [TestCase] = [
(#filePath, #line,
"""
2
2 5
""", """
2
"""),
(#filePath, #line,
"""
3
3 2 5
""", """
5
"""),
(#filePath, #line,
"""
4
5 3 2 5
""", """
7
"""),
(#filePath, #line,
"""
5
2 5 3 2 5
""", """
7
"""),
//(#filePath, #line,
//"""
//20
//29 27 79 27 30 4 93 89 44 88 70 75 96 3 78 39 97 12 53 62
//""", """
//426
//"""),
]

final class ETests: XCTestCase, TimeLimit {
    let timeLimit: TimeInterval = 2.0

    func testExample() throws {
        try cases.forEach(solve)
    }
}
