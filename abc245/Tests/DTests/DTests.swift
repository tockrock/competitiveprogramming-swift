import XCTest
import TestLibrary

let cases: [TestCase] = [
(#filePath, #line,
"""
2 1
6 4 2
12 14 8 2
""", """
2 1
"""),
(#filePath, #line,
"""
1 1
100 1
10000 0 -1
""", """
100 -1
"""),
(#filePath, #line,
"""
3 2
1 3 2 1
1 6 13 13 7 2
""", """
1 3 2
"""),

]

final class DTests: XCTestCase, TimeLimit {
    let timeLimit: TimeInterval = 2.0

    func testExample() throws {
        try cases.forEach(solve)
    }
}
