// Book: ALDS1_8_B: Binary Search Tree II
// 2021-11-25 13:18:19

import Foundation
let DEBUG = true

struct Example {
    let input: String
    let expected: String
}

let examples: [(String, Example)] = [
    ("1", Example(
        input: """
            10
            insert 30
            insert 88
            insert 12
            insert 1
            insert 20
            find 12
            insert 17
            insert 25
            find 16
            print
            """,
        expected: """
            yes
            no
             1 12 17 20 25 30 88
             30 12 1 20 17 25 88
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
    
    var nodes = [Int:Node]()
    var rootId = -1
    
    func insert(id: Int) {
        nodes[id] = Node()
        if rootId == -1 {
            rootId = id
            return
        }
        
        var x: Int? = rootId
        var parentId = -1
        while x != nil {
            parentId = x!
            if id < parentId {
                x = nodes[parentId]!.l
            } else {
                x = nodes[parentId]!.r
            }
        }
        
        nodes[id]!.p = parentId
        
        if id < parentId {
            nodes[parentId]!.l = id
        } else {
            nodes[parentId]!.r = id
        }
    }
    
    func inorder(id: Int) -> [Int] {
        var ret = [Int]()
        if let l = nodes[id]!.l {
            ret += inorder(id: l)
        }
        ret.append(id)
        if let r = nodes[id]!.r {
            ret += inorder(id: r)
        }
        return ret
    }
    
    func preorder(id: Int) -> [Int] {
        var ret = [id]
        if let l = nodes[id]!.l {
            ret += preorder(id: l)
        }
        if let r = nodes[id]!.r {
            ret += preorder(id: r)
        }
        return ret
    }
    
    func printState() {
        print(" " + inorder(id: rootId).outputWithSpace())
        print(" " + preorder(id: rootId).outputWithSpace())
    }
    
    func find(id: Int) -> Bool {
        var x: Int = rootId
        while true {
            if id == x { return true }
            if id < x {
                guard let l = nodes[x]!.l else { return false }
                x = l
            } else {
                guard let r = nodes[x]!.r else { return false }
                x = r
            }
        }
    }
    
    let n = readInt()
    
    for _ in 0..<n {
        let input = readStrings()
        switch(input[0]) {
        case "insert":
            insert(id: Int(input[1])!)
        case "find":
            print(find(id: Int(input[1])!) ? "yes" : "no")
        case "print":
            printState()
        default:
            myDebugPrint("unexpected input \(input[0])")
        }
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
