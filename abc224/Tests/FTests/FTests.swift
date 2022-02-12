import XCTest
import TestLibrary

let cases: [TestCase] = [
(#filePath, #line,
"""
1234
""", """
1736
"""),
(#filePath, #line,
"""
1
""", """
1
"""),
(#filePath, #line,
"""
31415926535897932384626433832795
""", """
85607943
"""),
]

final class FTests: XCTestCase, TimeLimit {
    let timeLimit: TimeInterval = 2.0

    func testExample() throws {
        try cases.forEach(solve)
    }
}