import XCTest
import TestLibrary

let cases: [TestCase] = [
(#filePath, #line,
"""
5 3
2 1 6 3 1
""", """
11
"""),
(#filePath, #line,
"""
10 1000000000000
260522 914575 436426 979445 648772 690081 933447 190629 703497 47202
""", """
826617499998784056
"""),
]

final class ETests: XCTestCase, TimeLimit {
    let timeLimit: TimeInterval = 2.0

    func testExample() throws {
        try cases.forEach(solve)
    }
}