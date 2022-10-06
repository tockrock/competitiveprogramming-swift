import XCTest
import TestLibrary

let cases: [TestCase] = [
(#filePath, #line,
"""
7
5 3 10101010
5 3 01010101
5 3 11111111
5 3 00000000
0 0 11111111
0 1 10001111
-1000000000 1000000000 10010011
""", """
8
5
5
-1
0
-1
1000000000
"""),
]

final class ExTests: XCTestCase, TimeLimit {
    let timeLimit: TimeInterval = 5.0

    func testExample() throws {
        try cases.forEach(solve)
    }
}