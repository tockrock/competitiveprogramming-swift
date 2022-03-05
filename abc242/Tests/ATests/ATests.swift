import XCTest
import TestLibrary

let cases: [TestCase] = [
(#filePath, #line,
"""
30 500 20 103
""", """
0.042553191489
"""),
(#filePath, #line,
"""
50 500 100 1
""", """
1.000000000000
"""),
(#filePath, #line,
"""
1 2 1 1000
""", """
0.000000000000
"""),
]

final class ATests: XCTestCase, TimeLimit {
    let timeLimit: TimeInterval = 2.0

    func testExample() throws {
        try cases.forEach(solve)
    }
}
