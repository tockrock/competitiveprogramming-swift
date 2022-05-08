import XCTest
import TestLibrary

let cases: [TestCase] = [
(#filePath, #line,
"""
8
2 5 4 3 7 1 8 6
""", """
16
"""),
(#filePath, #line,
"""
5
10000 1000 100 10 1
""", """
0
"""),
(#filePath, #line,
"""
15
300 1 4000 1 50000 900000000 20 600000 50000 300 50000 80000000 900000000 7000000 900000000
""", """
2787595378
"""),
]

final class GTests: XCTestCase, TimeLimit {
    let timeLimit: TimeInterval = 2.0

    func testExample() throws {
        try cases.forEach(solve)
    }
}