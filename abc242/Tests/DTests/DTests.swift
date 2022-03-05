import XCTest
import TestLibrary

let cases: [TestCase] = [
(#filePath, #line,
"""
ABC
4
0 1
1 1
1 3
1 6
""", """
A
B
C
B
"""),
(#filePath, #line,
"""
CBBAACCCCC
5
57530144230160008 659279164847814847
29622990657296329 861239705300265164
509705228051901259 994708708957785197
176678501072691541 655134104344481648
827291290937314275 407121144297426665
""", """
A
A
C
A
A
"""),
]

final class DTests: XCTestCase, TimeLimit {
    let timeLimit: TimeInterval = 2.0

    func testExample() throws {
        try cases.forEach(solve)
    }
}
