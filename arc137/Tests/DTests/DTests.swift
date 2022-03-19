import XCTest
import TestLibrary

let cases: [TestCase] = [
(#filePath, #line,
"""
3 2
2 1 3
""", """
0 1
"""),
(#filePath, #line,
"""
10 12
721939838 337089195 171851101 1069204754 348295925 77134863 839878205 89360649 838712948 918594427
""", """
716176219 480674244 678890528 642764255 259091950 663009497 942498522 584528336 364872846 145822575 392655861 844652404
"""),
]

final class DTests: XCTestCase, TimeLimit {
    let timeLimit: TimeInterval = 4.0

    func testExample() throws {
        try cases.forEach(solve)
    }
}