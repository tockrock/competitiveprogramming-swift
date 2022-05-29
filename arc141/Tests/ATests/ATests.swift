import XCTest
import TestLibrary

let cases: [TestCase] = [
(#filePath, #line,
"""
4
1412
23
498650499498649123
10000000000000000
""", """
1313
22
498650498650498650
9999999999999999
"""),
]

final class ATests: XCTestCase, TimeLimit {
    let timeLimit: TimeInterval = 2.0

    func testExample() throws {
        try cases.forEach(solve)
    }
}
