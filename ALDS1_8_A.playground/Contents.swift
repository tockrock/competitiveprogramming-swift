// Book: ALDS1_8_A: Binary Search Tree I
// 2021-11-25 10:19:11

import Foundation
let DEBUG = true

struct Example {
    let input: String
    let expected: String
}

let examples: [(String, Example)] = [
    ("1", Example(
        input: """
            8
            insert 30
            insert 88
            insert 12
            insert 1
            insert 20
            insert 17
            insert 25
            print
            """,
        expected: """
            1 12 17 20 25 30 88
            30 12 1 20 17 25 88
            """)),
    ("2", Example(
        input: """
            17
            insert 35
            insert 80
            insert 42
            print
            insert 3
            insert 86
            insert 99
            print
            insert 70
            insert 14
            insert 21
            insert 1
            print
            insert 56
            insert 81
            insert 7
            print
            """,
        expected: """
            35 42 80
            35 80 42
            3 35 42 80 86 99
            35 3 80 42 86 99
            1 3 14 21 35 42 70 80 86 99
            35 3 1 14 21 80 42 70 86 99
            1 3 7 14 21 35 42 56 70 80 81 86 99
            35 3 1 14 7 21 80 42 70 56 86 81 99
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
    
    class Node {
        let id: Int
        var p: Node? = nil
        var l: Node? = nil
        var r: Node? = nil
        
        init(id: Int) {
            self.id = id
        }
        
        
    }
        
    var root = Node(id: -1)
    func insert(id: Int) {
        let current = Node.init(id: id)
        
        var parent = root
        
        while true {
            if id < parent.id {
                guard let l = parent.l else {
                    parent.l = current
                    break
                }
                parent = l
            } else {
                guard let r = parent.r else {
                    parent.r = current
                    break
                }
                parent = r
            }
        }
        current.p = parent
    }
    
    func inorder(node: Node) -> [Int] {
        var ret = [Int]()
        if let l = node.l {
            ret += inorder(node: l)
        }
        ret += [node.id]
        if let r = node.r {
            ret += inorder(node: r)
        }
        return ret
    }
    
    func preorder(node: Node) -> [Int] {
        var ret = [Int]()
        if let l = node.l {
            ret += preorder(node: l)
        }
        if let r = node.r {
            ret += preorder(node: r)
        }
        
        return [node.id] + ret
    }
    
    func printCurrentState() {
        print(inorder(node: root).outputWithSpace())
        print(preorder(node: root).outputWithSpace())
    }
    
    let n = readInt()
    
    for i in 0..<n {
        let input = readStrings()
        switch input[0] {
        case "insert":
            let id = Int(input[1])!
            if i == 0 {
                root = Node(id: id)
            } else {
                insert(id: id)
            }
        case "print":
            printCurrentState()
        default:
            print("unexpectedinput")
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
