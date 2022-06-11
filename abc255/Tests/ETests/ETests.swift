import XCTest
import TestLibrary

let cases: [TestCase] = [
(#filePath, #line,
"""
9 2
2 3 3 4 -4 -7 -4 -1
-1 5
""", """
4
"""),
(#filePath, #line,
"""
20 10
-183260318 206417795 409343217 238245886 138964265 -415224774 -499400499 -313180261 283784093 498751662 668946791 965735441 382033304 177367159 31017484 27914238 757966050 878978971 73210901
-470019195 -379631053 -287722161 -231146414 -84796739 328710269 355719851 416979387 431167199 498905398
""", """
8
"""),
]

final class ETests: XCTestCase, TimeLimit {
    let timeLimit: TimeInterval = 4.0

    func testExample() throws {
        try cases.forEach(solve)
    }
}