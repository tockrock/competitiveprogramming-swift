// Book: ALDS1_7_A: Rooted Trees
// 2021-11-24 12:38:48

import Foundation
let DEBUG = true

struct Example {
    let input: String
    let expected: String
}

let examples: [(String, Example)] = [
    ("1", Example(
        input: """
            13
            0 3 1 4 10
            1 2 2 3
            2 0
            3 0
            4 3 5 6 7
            5 0
            6 0
            7 2 8 9
            8 0
            9 0
            10 2 11 12
            11 0
            12 0
            """,
        expected: """
            node 0: parent = -1, depth = 0, root, [1, 4, 10]
            node 1: parent = 0, depth = 1, internal node, [2, 3]
            node 2: parent = 1, depth = 2, leaf, []
            node 3: parent = 1, depth = 2, leaf, []
            node 4: parent = 0, depth = 1, internal node, [5, 6, 7]
            node 5: parent = 4, depth = 2, leaf, []
            node 6: parent = 4, depth = 2, leaf, []
            node 7: parent = 4, depth = 2, internal node, [8, 9]
            node 8: parent = 7, depth = 3, leaf, []
            node 9: parent = 7, depth = 3, leaf, []
            node 10: parent = 0, depth = 1, internal node, [11, 12]
            node 11: parent = 10, depth = 2, leaf, []
            node 12: parent = 10, depth = 2, leaf, []
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
    
    
    let n = readInt()
    
    struct Node {
        var parent: Int?
        var leftChild: Int?
        var rightSibling: Int?
        
        func getState() -> String {
            if parent == nil { return "root" }
            if leftChild == nil { return "leaf" }
            return "internal node"
        }
    }
//    var tree = [(id: Int, child_count: Int, children: [Int])]()
    var nodes = [Node](repeating: Node(parent: nil, leftChild: nil, rightSibling: nil), count: n)
        
    for _ in 1...n {
        let input = readInts()
        let id = input[0]
        let m = input[1]
        let children = Array(input[2...])

        for i in 0..<m {
            let child = children[i]
            nodes[child].parent = id
            if i == 0 {
                nodes[id].leftChild = child
                continue
            }
            nodes[children[i-1]].rightSibling = child
        }

    }
    
    var depthMap = [Int](repeating: 0, count: n)
    
    func recordDepth(id: Int, depth: Int) {
        depthMap[id] = depth
        if let right = nodes[id].rightSibling {
            recordDepth(id: right, depth: depth)
        }
        if let child = nodes[id].leftChild {
            recordDepth(id: child, depth: depth + 1)
        }
    }
    
    for i in 0..<n {
        if nodes[i].parent == nil {
            recordDepth(id: i, depth: 0)
            break
        }
    }
    
    func getSibling(id: Int?) -> [Int] {
        guard let id = id else { return [] }
        return [id] + getSibling(id: nodes[id].rightSibling)
    }
        
    for (id, node) in nodes.enumerated() {
        print("""
            node \(id): \
            parent = \(node.parent ?? -1), \
            depth = \(depthMap[id]), \
            \(node.getState()), \
            \(getSibling(id: node.leftChild))
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
