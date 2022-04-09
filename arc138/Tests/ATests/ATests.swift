import XCTest
import TestLibrary

let cases: [TestCase] = [
(#filePath, #line,
"""
4 2
2 1 1 2
""", """
2
"""),
(#filePath, #line,
"""
3 1
3 2 1
""", """
-1
"""),
(#filePath, #line,
"""
20 13
90699850 344821203 373822335 437633059 534203117 523743511 568996900 694866636 683864672 836230375 751240939 942020833 865334948 142779837 22252499 197049878 303376519 366683358 545670804 580980054
""", """
13
"""),
]

final class ATests: XCTestCase, TimeLimit {
    let timeLimit: TimeInterval = 3.0

    func testExample() throws {
        try cases.forEach(solve)
    }
}