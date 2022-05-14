// https://algo-method.com/tasks/917
// 2022-05-15 07:33:44

import Foundation

struct Example {
    let input: String
    let expected: String
}

let examples: [(String, Example)] = [
    ("1", Example(
        input: """
            """,
        expected: """
            5 2 1 3 4 7 6 9 8
            """)),
]

// =================================
// Extensions
// Remember to paste these as well!!
// =================================

struct BinaryTree<T: Comparable> {
    
    private class Node: Comparable {
        let key: T
        var left: Node? = nil
        var right: Node? = nil
        
        init(_ key: T) {
            self.key = key
        }
        
        static func == (lhs: Node, rhs: Node) -> Bool {
            return lhs.key == rhs.key
        }
        
        static func < (lhs: Node, rhs: Node) -> Bool {
            return lhs.key < rhs.key
        }
    }
    
    private var root: Node? = nil

    mutating func append(contentsOf keys: [T]) {
        for key in keys {
            let node = Node(key)
            guard let root = root else {
                root = node
                continue
            }
            var next = root
            
            while true {
                if node <= next {
                    guard let left = next.left else {
                        next.left = node
                        break
                    }
                    next = left
                } else {
                    guard let right = next.right else {
                        next.right = node
                        break
                    }
                    next = right
                }
            }
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

func run(readLine: () -> String?, print: (Any...) -> Void) {
    // =====================
    // actual code goes here
    // =====================
    
    let keys = [5, 2, 3, 7, 9, 4, 1, 6, 8]
    
    var tree = BinaryTree<Int>()
    tree.append(contentsOf: keys)
    let result = tree.preorder()
    
    print(result.map(\.description).joined(separator: " "))
    
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

func myDebugPrint (_ s: Any... ) { Swift.print(s.map {"\($0)"}.joined(separator: " ")) }
