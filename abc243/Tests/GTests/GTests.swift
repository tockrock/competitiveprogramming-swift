import XCTest
import TestLibrary

let cases: [TestCase] = [
(#filePath, #line,
"""
4
16
1
123456789012
1000000000000000000
""", """
5
1
4555793983
23561347048791096
"""),
]

final class GTests: XCTestCase, TimeLimit {
    let timeLimit: TimeInterval = 2.0

    func testExample() throws {
        try cases.forEach(solve)
    }
}