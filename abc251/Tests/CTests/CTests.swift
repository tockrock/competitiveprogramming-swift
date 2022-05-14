import XCTest
import TestLibrary

let cases: [TestCase] = [
(#filePath, #line,
"""
3
aaa 10
bbb 20
aaa 30
""", """
2
"""),
(#filePath, #line,
"""
5
aaa 9
bbb 10
ccc 10
ddd 10
bbb 11
""", """
2
"""),
(#filePath, #line,
"""
10
bb 3
ba 1
aa 4
bb 1
ba 5
aa 9
aa 2
ab 6
bb 5
ab 3
""", """
8
"""),
]

final class CTests: XCTestCase, TimeLimit {
    let timeLimit: TimeInterval = 2.0

    func testExample() throws {
        try cases.forEach(solve)
    }
}