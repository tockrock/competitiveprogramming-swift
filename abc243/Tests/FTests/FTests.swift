import XCTest
import TestLibrary

let cases: [TestCase] = [
(#filePath, #line,
"""
2 1 2
2
1
""", """
221832079
"""),
(#filePath, #line,
"""
3 3 2
1
1
1
""", """
0
"""),
(#filePath, #line,
"""
3 3 10
499122176
499122175
1
""", """
335346748
"""),
(#filePath, #line,
"""
10 8 15
1
1
1
1
1
1
1
1
1
1
""", """
755239064
"""),
]

final class FTests: XCTestCase, TimeLimit {
    let timeLimit: TimeInterval = 2.0

    func testExample() throws {
        try cases.forEach(solve)
    }
}