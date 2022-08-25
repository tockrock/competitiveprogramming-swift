import XCTest
import TestLibrary

let cases: [TestCase] = [
(#filePath, #line,
"""
3
a -5
ab 10
ba -20
""", """
Infinity
"""),
(#filePath, #line,
"""
28
a -5
ab 10
ba -20
bb -20
bc -20
bd -20
be -20
bf -20
bg -20
bh -20
bi -20
bj -20
bk -20
bl -20
bm -20
bn -20
bo -20
bp -20
bq -20
br -20
bs -20
bt -20
bu -20
bv -20
bw -20
bx -20
by -20
bz -20
""", """
5
"""),
(#filePath, #line,
"""
26
a -1
b -1
c -1
d -1
e -1
f -1
g -1
h -1
i -1
j -1
k -1
l -1
m -1
n -1
o -1
p -1
q -1
r -1
s -1
t -1
u -1
v -1
w -1
x -1
y -1
z -1
""", """
-1
"""),
]

final class GTests: XCTestCase, TimeLimit {
    let timeLimit: TimeInterval = 2.0

    func testExample() throws {
        try cases.forEach(solve)
    }
}