import XCTest
import TestLibrary

let cases: [TestCase] = [
(#filePath, #line,
"""
333
""", """
65287.907678222
"""),
(#filePath, #line,
"""
634
""", """
90086.635834623
"""),
]

final class ATests: XCTestCase, TimeLimit {
    let timeLimit: TimeInterval = 2.0

    func testExample() throws {
        try cases.forEach(solve)
    }
}