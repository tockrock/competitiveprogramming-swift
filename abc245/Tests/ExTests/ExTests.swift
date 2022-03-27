import XCTest
import TestLibrary

let cases: [TestCase] = [
(#filePath, #line,
"""
2 3 6
""", """
5
"""),
(#filePath, #line,
"""
10 0 2
""", """
1023
"""),
(#filePath, #line,
"""
1000000000 20220326 1000000000000
""", """
561382653
"""),
]

final class ExTests: XCTestCase, TimeLimit {
    let timeLimit: TimeInterval = 2.0

    func testExample() throws {
        try cases.forEach(solve)
    }
}