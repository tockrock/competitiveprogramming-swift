import XCTest
import TestLibrary

let cases: [TestCase] = [
(#filePath, #line,
"""
3 1
""", """
0 4 2 
"""),
(#filePath, #line,
"""
4 3
""", """
12 12 0 0 
"""),
(#filePath, #line,
"""
10 5
""", """
1263360 1401600 710400 211200 38400 3840 0 0 0 0 
"""),
]

final class FTests: XCTestCase, TimeLimit {
    let timeLimit: TimeInterval = 8.0

    func testExample() throws {
        try cases.forEach(solve)
    }
}