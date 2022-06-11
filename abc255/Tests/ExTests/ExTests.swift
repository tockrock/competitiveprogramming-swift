import XCTest
import TestLibrary

let cases: [TestCase] = [
(#filePath, #line,
"""
5 3
2 2 3
3 3 4
5 1 5
""", """
10
15
50
"""),
(#filePath, #line,
"""
711741968710511029 1
82803157126515475 516874290286751784 588060532191410838
""", """
603657470
"""),
]

final class ExTests: XCTestCase, TimeLimit {
    let timeLimit: TimeInterval = 8.0

    func testExample() throws {
        try cases.forEach(solve)
    }
}