import XCTest
import TestLibrary

let cases: [TestCase] = [
(#filePath, #line,
"""
3
1 1 100
1 20 10
2 1 1
""", """
2
100
11
"""),
(#filePath, #line,
"""
10
1 4 142135623
2 6 457513110
3 1 622776601
5 1 961524227
2 2 360679774
2 4 494897427
3 7 416573867
5 2 915026221
1 7 320508075
5 3 851648071
""", """
4
961524227
1537802822
2032700249
2353208324
"""),
]

final class GTests: XCTestCase, TimeLimit {
    let timeLimit: TimeInterval = 2.0

    func testExample() throws {
        try cases.forEach(solve)
    }
}