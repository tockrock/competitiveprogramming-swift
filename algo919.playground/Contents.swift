// https://algo-method.com/tasks/919
// 2022-05-17 08:39:26

import Foundation

struct Example {
    let input: String
    let expected: String
}

let examples: [(String, Example)] = [
    ("1", Example(
        input: """
            8
            0 7
            0 2
            1 8
            0 12
            0 8
            0 5
            1 8
            1 3
            """,
        expected: """
            No
            Yes
            No
            """)),
    ("2", Example(
        input: """
            10
            1 1
            0 10
            1 11
            1 10
            0 1000
            0 100000
            1 100
            1 1000
            0 10000000
            0 1000000000
            """,
        expected: """
            No
            No
            Yes
            No
            Yes
            """)),
]

func run(readLine: () -> String?, print: (Any...) -> Void) {
    // =====================
    // actual code goes here
    // =====================
    
    enum Command: Int {
        case insert, search
    }
        
    var tree = BinaryTree<Int>()
    let Q = Int(readLine()!)!
    for _ in 0..<Q {
        let query = readInts()
        switch Command(rawValue: query[0])! {
        case .insert:
            tree.insert(query[1])
        case .search:
            print(tree.search(query[1]) ? "Yes" : "No")
        }
        
    }
    
    func readInts() -> [Int] { readLine()!.split(separator: " ").map { Int(String($0))! } }

    // ===============
    // actual code end
    // ===============
}

// =================================
// Extensions
// Remember to paste these as well!!
// =================================

struct BinaryTree<T: Comparable> {
    private final class Node {
        let key: T
        var left: Node?
        var right: Node?
        
        init(_ key: T) {
            self.key = key
        }
        
        func insert(node: Node) -> Node {
            if node.key <= key {
                left = left?.insert(node: node) ?? node
            } else {
                right = right?.insert(node: node) ?? node
            }
            return self
        }
        
        func search(value: T) -> Node? {
            if value == key {
                return self
            } else if value < key {
                return left?.search(value: value)
            } else {
                return right?.search(value: value)
            }
        }
    }
    
    private var root: Node?
    
    mutating func insert(_ value: T) {
        let node = Node(value)
        root = root?.insert(node: node) ?? node
    }
        
    func search(_ value: T) -> Bool {
        return root?.search(value: value) != nil
    }
}

// ====================
// Extensions Ends Here
// ====================

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
