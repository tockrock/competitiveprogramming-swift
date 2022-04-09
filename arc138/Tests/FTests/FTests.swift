import XCTest
import TestLibrary

let cases: [TestCase] = [
(#filePath, #line,
"""
3
3 1 2
""", """
3
"""),
(#filePath, #line,
"""
5
1 2 3 4 5
""", """
1
"""),
(#filePath, #line,
"""
10
3 6 4 8 7 2 10 5 9 1
""", """
1332
"""),
(#filePath, #line,
"""
30
7 11 8 26 4 13 28 5 14 1 16 27 10 2 23 25 17 6 3 18 24 15 9 22 21 29 12 20 19 30
""", """
641915679
"""),
]

final class FTests: XCTestCase, TimeLimit {
    let timeLimit: TimeInterval = 4.0

    func testExample() throws {
        try cases.forEach(solve)
    }
}