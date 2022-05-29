import XCTest
import TestLibrary

let cases: [TestCase] = [
(#filePath, #line,
"""
3
A
B
C
""", """
No
"""),
(#filePath, #line,
"""
1
ABA
""", """
Yes
"""),
(#filePath, #line,
"""
4
CBA
ACB
AD
CAB
""", """
Yes
"""),
]

final class FTests: XCTestCase, TimeLimit {
    let timeLimit: TimeInterval = 8.0

    func testExample() throws {
        try cases.forEach(solve)
    }
}