// Book: ALDS1_7_B: Binary Tree
// 2021-11-24 14:24:29

import Foundation
let DEBUG = true

struct Example {
    let input: String
    let expected: String
}

let examples: [(String, Example)] = [
    ("1", Example(
        input: """
            9
            0 1 4
            1 2 3
            2 -1 -1
            3 -1 -1
            4 5 8
            5 6 7
            6 -1 -1
            7 -1 -1
            8 -1 -1
            """,
        expected: """
            node 0: parent = -1, sibling = -1, degree = 2, depth = 0, height = 3, root
            node 1: parent = 0, sibling = 4, degree = 2, depth = 1, height = 1, internal node
            node 2: parent = 1, sibling = 3, degree = 0, depth = 2, height = 0, leaf
            node 3: parent = 1, sibling = 2, degree = 0, depth = 2, height = 0, leaf
            node 4: parent = 0, sibling = 1, degree = 2, depth = 1, height = 2, internal node
            node 5: parent = 4, sibling = 8, degree = 2, depth = 2, height = 1, internal node
            node 6: parent = 5, sibling = 7, degree = 0, depth = 3, height = 0, leaf
            node 7: parent = 5, sibling = 6, degree = 0, depth = 3, height = 0, leaf
            node 8: parent = 4, sibling = 5, degree = 0, depth = 2, height = 0, leaf
            """)),
]

func run(readLine: () -> String?, print: (Any...) -> Void) {
    // these needs to be in run() to get the overwritten readLine()
    func readString () -> String { readLine()! }
    func readSubsequence () -> [String.SubSequence] { readString().split(separator: " ")}
    func readChars () -> [Character] {readString().map({$0})}
    func readStrings () -> [String] { readSubsequence().map({String($0)}) }
    func readInt() -> Int { Int(readString())! }
    func readInts() -> [Int] { readSubsequence().map{Int($0)!} }
    func readTwoInts() -> (Int, Int) {
        let ints = readInts()
        return (ints[0], ints[1])
    }
    func readThreeInts() -> (Int, Int, Int) {
        let ints = readInts()
        return (ints[0], ints[1], ints[2])
    }
    
    // =====================
    // actual code goes here
    // =====================
    
    struct Node {
        var p = -1
        var l = -1
        var r = -1
        var depth = -1
        var height = -1
        var degree = -1
        var sibling = -1
        
        var state: String {
            if p == -1 { return "root" }
            if l == -1 { return "leaf" }
            return "internal node"
        }
    }
    
    let n = readInt()
    
    var T = [Node](repeating: Node(), count: n)
    for _ in 0..<n {
        let (id, left, right) = readThreeInts()
        T[id].l = left
        T[id].r = right
        var degree = 0
        if left > -1 {
            T[left].p = id
            degree += 1
            if right > -1 {
                T[right].p = id
                T[right].sibling = left
                T[left].sibling = right
                degree += 1
            }
        }
        T[id].degree = degree
    }
    
    func setDepth(id: Int, depth: Int) -> Int {
        T[id].depth = depth
        var maxDepth = depth
        if T[id].l > 0 {
            maxDepth = max(setDepth(id: T[id].l, depth: depth + 1), maxDepth)
        }
        if T[id].r > 0 {
            maxDepth = max(setDepth(id: T[id].r, depth: depth + 1), maxDepth)
        }
        T[id].height = maxDepth - depth
        return maxDepth
    }
    
    for i in 0..<n {
        if T[i].p == -1 {
            setDepth(id: i, depth: 0)
        }
    }
    
    
    for (i, node) in T.enumerated() {
        print("""
            node \(i): \
            parent = \(node.p), \
            sibling = \(node.sibling), \
            degree = \(node.degree), \
            depth = \(node.depth), \
            height = \(node.height), \
            \(node.state)
            """)
    }
    
    // ===============
    // actual code end
    // ===============
    
}

func main(label: String, example: Example) {
    var inputLines = example.input.split(separator: "\n")
    var outputLines: [String] = []
    defer {
        var expectedLines = example.expected
            .split(separator: "\n")
            .map(String.init)
        let isSuccessful = expectedLines == outputLines
        print("== Test[\(label)] =========")
        print(isSuccessful ? "successful." : "failed.")
        // print(outputLines, expectedLines)
        if !isSuccessful {
            print("expected | actual")
            while !outputLines.isEmpty && !expectedLines.isEmpty {
                let o = outputLines.removeFirst()
                let e = expectedLines.removeFirst()
                print("\(o == e ? " " : "!") \(e) | \(o)")
            }
        }
        print("")
    }
    run(
        readLine: { String(inputLines.removeFirst()) },
        print: { outputLines.append($0.map {"\($0)"}.joined(separator: " ")) }
    )
}

for example in examples {
    main(label: example.0, example: example.1)
}
func myDebugPrint (_ s: Any... ) { if DEBUG { Swift.print(s.map({"\($0)"}).joined(separator: " ")) } }
func gcd(_ a: Int, _ b: Int) -> Int {
    if b == 0 { return a }
    return gcd(b, a%b)
}
func pf(_ numb: Int) -> [(prime: Int, count: Int)] {
    var n = numb, i = 2, primeList = [(Int, Int)]()
    while i * i <= numb && i <= n {
        var count = 0
        while n % i == 0 { n /= i; count += 1 }
        if count > 0 { primeList.append((i, count)) }
        i += 1
    }
    if n != 1 { primeList.append((n, 1)) }
    return primeList
}
