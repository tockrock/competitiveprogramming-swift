import XCTest
import TestLibrary

let cases: [TestCase] = [
(#filePath, #line,
"""
4
4 8 12 90
""", """
3
"""),
(#filePath, #line,
"""
20
313923 246114 271842 371982 284858 10674 532090 593483 185123 364245 665161 241644 604914 645577 410849 387586 732231 952593 249651 36908
""", """
6
"""),
(#filePath, #line,
"""
5
1 1 1 1 1
""", """
10
"""),
]

final class DTests: XCTestCase, TimeLimit {
    let timeLimit: TimeInterval = 4.0

    func testExample() throws {
        try cases.forEach(solve)
    }
}