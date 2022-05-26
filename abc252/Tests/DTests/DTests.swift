import XCTest
import TestLibrary

let cases: [TestCase] = [
(#filePath, #line,
"""
4
3 1 4 1
""", """
2
"""),
(#filePath, #line,
"""
5
3 1 4 1 1
""", """
3
"""),
(#filePath, #line,
"""
6
3 1 4 1 1 4
""", """
6
"""),
//(#filePath, #line,
//"""
//7
//3 1 4 1 1 4 5
//""", """
//15
//"""),
//
//(#filePath, #line,
//"""
//8
//3 1 4 1 1 4 5 5
//""", """
//6
//"""),
(#filePath, #line,
"""
10
99999 99998 99997 99996 99995 99994 99993 99992 99991 99990
""", """
120
"""),
(#filePath, #line,
"""
15
3 1 4 1 5 9 2 6 5 3 5 8 9 7 9
""", """
355
"""),
]

final class DTests: XCTestCase, TimeLimit {
    let timeLimit: TimeInterval = 2.0

    func testExample() throws {
        try cases.forEach(solve)
    }
}