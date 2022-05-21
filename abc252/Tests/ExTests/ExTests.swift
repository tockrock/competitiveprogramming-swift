import XCTest
import TestLibrary

let cases: [TestCase] = [
(#filePath, #line,
"""
4 2 3
2 4
2 6
1 2
1 3
""", """
5
"""),
(#filePath, #line,
"""
3 1 2
1 0
1 0
1 0
""", """
0
"""),
(#filePath, #line,
"""
10 3 11
1 414213562373095048
1 732050807568877293
2 236067977499789696
2 449489742783178098
2 645751311064590590
2 828427124746190097
3 162277660168379331
3 316624790355399849
3 464101615137754587
3 605551275463989293
""", """
766842905529259824
"""),
]

final class ExTests: XCTestCase, TimeLimit {
    let timeLimit: TimeInterval = 2.0

    func testExample() throws {
        try cases.forEach(solve)
    }
}