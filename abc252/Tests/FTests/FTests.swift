import XCTest
import TestLibrary

let cases: [TestCase] = [
(#filePath, #line,
"""
5 7
1 2 1 2 1
""", """
16
"""),
(#filePath, #line,
"""
3 1000000000000000
1000000000 1000000000 1000000000
""", """
1000005000000000
"""),
]

final class FTests: XCTestCase, TimeLimit {
    let timeLimit: TimeInterval = 2.0

    func testExample() throws {
        try cases.forEach(solve)
    }
}