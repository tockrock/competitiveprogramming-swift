import XCTest
import TestLibrary

let cases: [TestCase] = [
(#filePath, #line,
"""
5
5 100
1 10
10 1
1000000000000000000 1
100 100
""", """
525
10
55
75433847
61074
"""),
]

final class ETests: XCTestCase, TimeLimit {
    let timeLimit: TimeInterval = 6.0

    func testExample() throws {
        try cases.forEach(solve)
    }
}