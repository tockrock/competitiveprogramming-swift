import XCTest
import TestLibrary

let cases: [TestCase] = [
(#filePath, #line,
"""
2 3
--o
o--
""", """
3
"""),
(#filePath, #line,
"""
5 4
-o--
----
----
----
-o--
""", """
4
"""),
]

final class BTests: XCTestCase, TimeLimit {
    let timeLimit: TimeInterval = 2.0

    func testExample() throws {
        try cases.forEach(solve)
    }
}