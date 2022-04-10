import XCTest
import TestLibrary

let cases: [TestCase] = [
(#filePath, #line,
"""
3
tanaka taro
tanaka jiro
suzuki hanako
""", """
Yes
"""),
(#filePath, #line,
"""
3
aaa bbb
xxx aaa
bbb yyy
""", """
No
"""),
(#filePath, #line,
"""
2
tanaka taro
tanaka taro
""", """
No
"""),
(#filePath, #line,
"""
3
takahashi chokudai
aoki kensho
snu ke
""", """
Yes
"""),
]

final class BTests: XCTestCase, TimeLimit {
    let timeLimit: TimeInterval = 2.0

    func testExample() throws {
        try cases.forEach(solve)
    }
}