import XCTest
import TestLibrary

let cases: [TestCase] = [
(#filePath, #line,
"""
5 3
6 11 2 5 5
5
20
0
""", """
10
71
29
"""),
(#filePath, #line,
"""
10 5
1000000000 314159265 271828182 141421356 161803398 0 777777777 255255255 536870912 998244353
555555555
321654987
1000000000
789456123
0
""", """
3316905982
2811735560
5542639502
4275864946
4457360498
"""),
]

final class DTests: XCTestCase, TimeLimit {
    let timeLimit: TimeInterval = 2.0

    func testExample() throws {
        try cases.forEach(solve)
    }
}
