import XCTest
import TestLibrary

let cases: [TestCase] = [
(#filePath, #line,
"""
5
3
AXA
6
ABCZAZ
30
QWERTYUIOPASDFGHJKLZXCVBNMQWER
28
JVIISNEOXHSNEAAENSHXOENSIIVJ
31
KVOHEEMSOZZASHENDIGOJRTJVMVSDWW
""", """
24
29
212370247
36523399
231364016
"""),
]

final class ETests: XCTestCase, TimeLimit {
    let timeLimit: TimeInterval = 2.0

    func testExample() throws {
        try cases.forEach(solve)
    }
}