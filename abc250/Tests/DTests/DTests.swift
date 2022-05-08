import XCTest
import TestLibrary

let cases: [TestCase] = [
(#filePath, #line,
"""
250
""", """
2
"""),
(#filePath, #line,
"""
1
""", """
0
"""),
(#filePath, #line,
"""
123456789012345
""", """
226863
"""),
]

final class DTests: XCTestCase, TimeLimit {
    let timeLimit: TimeInterval = 2.0

    func testExample() throws {
        try cases.forEach(solve)
    }
}
