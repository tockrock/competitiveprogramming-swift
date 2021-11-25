// Book: ALDS1_7_C: Tree Walk
// 2021-11-25 08:05:46

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
            Preorder
            0 1 2 3 4 5 6 7 8
            Inorder
            2 1 3 0 6 5 7 4 8
            Postorder
            2 3 1 6 7 5 8 4 0
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
        var p: Int? = nil
        var l: Int? = nil
        var r: Int? = nil
    }
    let n = readInt()
    var nodes = [Node](repeating: Node(), count: n)
    
    for _ in 0..<n {
        let (id, left, right) = readThreeInts()
        
        if left > -1 {
            nodes[id].l = left
            nodes[left].p = id
        }
        if right > -1 {
            nodes[id].r = right
            nodes[right].p = id
        }
    }
    
    var root = -1
    for i in 0..<n {
        if nodes[i].p == nil {
            root = i
            break
        }
    }
    
    func preorder(id: Int) -> [Int] {
        var ret = [Int]()
        if let l = nodes[id].l {
            ret += preorder(id: l)
        }
        if let r = nodes[id].r {
            ret += preorder(id: r)
        }
        
        return [id] + ret
    }
    print("Preorder")
    print(preorder(id: root).outputSpaced())
    
    func inorder(id: Int) -> [Int] {
        var ret = [Int]()
        if let l = nodes[id].l {
            ret += inorder(id: l)
        }
        
        ret += [id]
        
        if let r = nodes[id].r {
            ret += inorder(id: r)
        }
        
        return ret
    }
    
    print("Inorder")
    print(inorder(id: root).outputSpaced())
    
    func postorder(id: Int) -> [Int] {
        var ret = [Int]()
        if let l = nodes[id].l {
            ret += postorder(id: l)
        }
        if let r = nodes[id].r {
            ret += postorder(id: r)
        }
        
        return ret + [id]
    }
    
    print("Postorder")
    print(postorder(id: root).outputSpaced())
    
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
extension Array {
    func outputSpaced() -> String {
        return String(self.reduce("", {$0 + "\($1) "}).dropLast(1))
    }
}
