import XCTest
import TestLibrary

let cases: [TestCase] = [
(#filePath, #line,
"""
5
3 0
2 3
-1 3
-3 1
-1 -1
""", """
1
"""),
(#filePath, #line,
"""
4
400000000 400000000
-400000000 400000000
-400000000 -400000000
400000000 -400000000
""", """
1280000000000000000
"""),
(#filePath, #line,
"""
6
-816 222
-801 -757
-165 -411
733 131
835 711
-374 979
""", """
157889
"""),
]

final class FTests: XCTestCase, TimeLimit {
    let timeLimit: TimeInterval = 2.0

    func testExample() throws {
        try cases.forEach(solve)
    }
}