// Book: ALDS1_8_C: Binary Search Tree III
// 2021-11-25 13:59:37

import Foundation
let DEBUG = true

struct Example {
    let input: String
    let expected: String
}

let examples: [(String, Example)] = [
    ("1", Example(
        input: """
            18
            insert 8
            insert 2
            insert 3
            insert 7
            insert 22
            insert 1
            find 1
            find 2
            find 3
            find 4
            find 5
            find 6
            find 7
            find 8
            print
            delete 3
            delete 7
            print
            """,
        expected: """
            yes
            yes
            yes
            no
            no
            no
            yes
            yes
             1 2 3 7 8 22
             8 2 1 3 7 22
             1 2 8 22
             8 2 1 22
            """)),
    ("2", Example(
        input: """
            12
            insert 8
            insert 2
            insert 1
            insert 6
            insert 7
            insert 4
            insert 5
            insert 3
            print
            delete 3
            delete 2
            print
            """,
        expected: """
             1 2 3 4 5 6 7 8
             8 2 1 6 4 3 5 7
             1 4 5 6 7 8
             8 4 1 6 5 7
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
    
    struct Node: CustomStringConvertible {
        var description: String {
            return "(p: \(String(describing: p)), l: \(String(describing: l)), r: \(String(describing: r)))"
        }
        
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
        var parentId = rootId
        while x != nil {
            parentId = x!
            if id < parentId {
                guard let l = nodes[parentId]!.l else { break }
                x = l
            } else {
                guard let r = nodes[parentId]!.r else { break }
                x = r
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
    
    func find(id: Int) -> Int? {
        var next: Int? = rootId
        
        while let x = next {
            if id == x {
                return next
            }
            if id < x {
                next = nodes[x]!.l
            } else {
                next = nodes[x]!.r
            }
        }
        return next
    }
    
    func swapPosition(parentId: Int) {
        myDebugPrint("Swapping \(parentId)...")
        guard let parentNode = nodes[parentId] else {
            myDebugPrint("Node \(parentId) doesn't exist")
            return
        }
        guard parentNode.l == nil || parentNode.r == nil else {
            myDebugPrint("Node \(parentId) have too many childs")
            return
        }

        let childId = parentNode.r != nil ? parentNode.r : parentNode.l
        let grandParentId = parentNode.p
        
        if let childId = childId {
            nodes[childId]!.p = grandParentId
        }
        
        if let grandParentId = grandParentId {
            if nodes[grandParentId]!.l == parentId {
                nodes[grandParentId]!.l = childId
            } else {
                nodes[grandParentId]!.r = childId
            }
        }
    }

    func delete(id: Int) {
        myDebugPrint("Deleting \(id)...")

        guard let node = nodes[id] else {
            myDebugPrint("Node \(id) doesn't exist")
            return
        }
        
        if node.r != nil && node.l != nil {
            let currentOrder = inorder(id: rootId)
            myDebugPrint(currentOrder)
            let position = currentOrder.firstIndex(of: id)!
            
            let nextId = currentOrder[position + 1]
            swapPosition(parentId: nextId)
            
            nodes[nextId]!.p = node.p
            nodes[nextId]!.l = node.l
            nodes[nextId]!.r = node.r
            
            if let l = node.l {
                nodes[l]!.p = nextId
            }
            if let r = node.r {
                nodes[r]!.p = nextId
            }
            if let p = node.p {
                if nodes[p]!.l == id {
                    nodes[p]!.l = nextId
                } else {
                    nodes[p]!.r = nextId
                }
            }
            
        } else {
            swapPosition(parentId: id)
        }
        
        nodes.removeValue(forKey: id)
    }
    
    
    let n = readInt()
    for _ in 0..<n {
        let command = readStrings()
        myDebugPrint(command)
        
        switch(command[0]) {
        case "insert":
            insert(id: Int(command[1])!)
        case "find":
            if find(id: Int(command[1])!) != nil {
                print("yes")
            } else {
                print("no")
            }
        case "print":
            printState()
        case "delete":
            delete(id: Int(command[1])!)
            myDebugPrint(nodes.sorted(by: {$0.key < $1.key}))
       default:
            myDebugPrint("Invalid command \(command[0])")
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
