// https://algo-method.com/tasks/918
// 2022-05-16 08:10:04

import Foundation

struct Example {
    let input: String
    let expected: String
}

let examples: [(String, Example)] = [
    ("1", Example(
        input: """
            11
            7
            12
            2
            5
            2
            8
            3
            6
            15
            11
            9
            """,
        expected: """
            7 2 2 5 3 6 12 8 11 9 15
            """)),
    ("2", Example(
        input: """
            7
            1
            2
            3
            1
            4
            5
            6
            """,
        expected: """
            1 1 2 3 4 5 6
            """)),
]

func run(readLine: () -> String?, print: (Any...) -> Void) {
    // =====================
    // actual code goes here
    // =====================
    
    // let mod = 1000000007
    // let mod = 998244353
    
    var tree = BinaryTree<Int>()
    
    let Q = Int(readLine()!)!
    
    for _ in 0..<Q {
        let v = Int(readLine()!)!
        tree.insert(v)
    }
    
    print(tree.preorder().map(\.description).joined(separator: " "))
    
    // ===============
    // actual code end
    // ===============
}

// =================================
// Extensions
// Remember to paste these as well!!
// =================================

struct BinaryTree<T: Comparable> {
    private class Node {        
        let key: T
        var left: Node?
        var right: Node?
        
        init(_ key: T) {
            self.key = key
        }
    }
    
    private var root: Node? = nil
    
    mutating func insert(_ key: T) {
        let node = Node(key)
        guard let root = root else {
            root = node
            return
        }
        
        _insert(node, under: root)
        
    }
    
    mutating private func _insert(_ node: Node, under p: Node) {
        if node.key <= p.key {
            guard let left = p.left else {
                p.left = node
                return
            }
            _insert(node, under: left)
        } else {
            guard let right = p.right else {
                p.right = node
                return
            }
            _insert(node, under: right)
        }
    }
    
    func preorder() -> [T] {
        var result = [T]()
        _preorder(node: root, result: &result)
        return result
    }
    
    private func _preorder(node: Node?, result: inout [T]) {
        guard let node = node else { return }
        result.append(node.key)
        _preorder(node: node.left, result: &result)
        _preorder(node: node.right, result: &result)
    }
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

func myDebugPrint (_ s: Any... ) { Swift.print(s.map {"\($0)"}.joined(separator: " ")) }
