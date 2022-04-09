import XCTest
import TestLibrary

let cases: [TestCase] = [
(#filePath, #line,
"""
3 2
""", """
1
"""),
(#filePath, #line,
"""
6 2
""", """
660
"""),
(#filePath, #line,
"""
10 3
""", """
242595
"""),
(#filePath, #line,
"""
100 10
""", """
495811864
"""),
]

final class ETests: XCTestCase, TimeLimit {
    let timeLimit: TimeInterval = 2.0

    func testExample() throws {
        try cases.forEach(solve)
    }
}