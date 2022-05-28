import XCTest
import TestLibrary

let cases: [TestCase] = [
(#filePath, #line,
"""
10 3 5
""", """
22
"""),
(#filePath, #line,
"""
1000000000 314 159
""", """
495273003954006262
"""),
]

final class DTests: XCTestCase, TimeLimit {
    let timeLimit: TimeInterval = 2.0

    func testExample() throws {
        try cases.forEach(solve)
    }
}