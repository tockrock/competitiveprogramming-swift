import XCTest
import TestLibrary

let cases: [TestCase] = [
(#filePath, #line,
"""
5 2 4 10 4
""", """
15.0000000000000000
"""),
(#filePath, #line,
"""
10 6 6 1 2
""", """
0.0000000000000000
"""),
(#filePath, #line,
"""
1000000000 1000000000 1 1000000000 1000000000
""", """
1000000000000000000.0000000000000000
"""),
]

final class GTests: XCTestCase, TimeLimit {
    let timeLimit: TimeInterval = 2.0

    func testExample() throws {
        try cases.forEach(solve)
    }
}