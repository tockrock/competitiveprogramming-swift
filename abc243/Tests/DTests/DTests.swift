import XCTest
import TestLibrary

let cases: [TestCase] = [
(#filePath, #line,
"""
3 2
URL
""", """
6
"""),
(#filePath, #line,
"""
4 500000000000000000
RRUU
""", """
500000000000000000
"""),
(#filePath, #line,
"""
30 123456789
LRULURLURLULULRURRLRULRRRUURRU
""", """
126419752371
"""),
]

final class DTests: XCTestCase, TimeLimit {
    let timeLimit: TimeInterval = 2.0

    func testExample() throws {
        try cases.forEach(solve)
    }
}