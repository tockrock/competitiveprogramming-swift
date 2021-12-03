// Book: ALDS1_9_A: Complete Binary Tree
// 2021-12-03 09:25:30

import Foundation
let DEBUG = true

struct Example {
    let input: String
    let expected: String
}

let examples: [(String, Example)] = [
    ("1", Example(
        input: """
            5
            7 8 1 2 3
            """,
        expected: """
            node 1: key = 7, left key = 8, right key = 1,
            node 2: key = 8, parent key = 7, left key = 2, right key = 3,
            node 3: key = 1, parent key = 7,
            node 4: key = 2, parent key = 8,
            node 5: key = 3, parent key = 8,
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
        let key: Int
        var parent: Int? = nil
        var l: Int? = nil
        var r: Int? = nil
    }
    
    let n = readInt()
    let input = readInts()
    
    var parentNode = 0
    var nodes = [Node]()
    
    nodes.append(Node(key: input[0]))
    for i in 1..<n {
        let key = input[i]
        nodes.append(Node(key: key, parent: nodes[parentNode].key))
        if nodes[parentNode].l == nil {
            nodes[parentNode].l = key
        } else {
            nodes[parentNode].r = key
            parentNode += 1
        }
    }
    
    for i in 0..<n {
        var answer = "node \(i + 1): key = \(nodes[i].key), "
        if let parent = nodes[i].parent {
            answer += "parent key = \(parent), "
        }
        if let left = nodes[i].l {
            answer += "left key = \(left), "
        }
        if let right = nodes[i].r {
            answer += "right key = \(right), "
        }
        
        print(answer.trimmingCharacters(in: .whitespaces))
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

// Only for the Book
extension Array {
    func outputWithSpace() -> String {
        return String(
            self.reduce("") {
                $0 + "\($1) "
            }.dropLast(1)
        )
    }
}
