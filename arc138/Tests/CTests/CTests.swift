import XCTest
import TestLibrary

let cases: [TestCase] = [
(#filePath, #line,
"""
4
3 4 1 2
""", """
1 7
"""),
(#filePath, #line,
"""
2
1 1
""", """
0 1
"""),
(#filePath, #line,
"""
10
716893678 779607519 555600775 393111963 950925400 636571379 912411962 44228139 15366410 2063694
""", """
7 3996409938
"""),
]

final class CTests: XCTestCase, TimeLimit {
    let timeLimit: TimeInterval = 2.0

    func testExample() throws {
        try cases.forEach(solve)
    }
}