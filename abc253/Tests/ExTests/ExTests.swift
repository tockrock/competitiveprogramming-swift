import XCTest
import TestLibrary

let cases: [TestCase] = [
(#filePath, #line,
"""
3 2
1 2
2 3
""", """
1
499122177
"""),
(#filePath, #line,
"""
4 5
1 2
1 2
1 4
2 3
2 4
""", """
1
758665709
918384805
"""),
]

final class ExTests: XCTestCase, TimeLimit {
    let timeLimit: TimeInterval = 2.0

    func testExample() throws {
        try cases.forEach(solve)
    }
}