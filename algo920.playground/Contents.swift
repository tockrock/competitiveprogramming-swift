// https://algo-method.com/tasks/920
// 2022-05-18 08:28:48

import Foundation

struct Example {
    let input: String
    let expected: String
}

let examples: [(String, Example)] = [
    ("1", Example(
        input: """
            9
            0 7
            0 2
            0 12
            0 8
            1 2
            0 5
            2 2
            2 9
            1 2
            """,
        expected: """
            Yes
            Complete
            Error
            No
            """)),
    ("2", Example(
        input: """
            11
            1 11
            2 10
            0 1
            0 10
            0 100
            0 1000
            2 10000
            2 10
            0 111
            1 100
            1 10
            """,
        expected: """
            No
            Error
            Error
            Complete
            Yes
            No
            """)),
]

func run(readLine: () -> String?, print: (Any...) -> Void) {
    // =====================
    // actual code goes here
    // =====================
    
    let Q = Int(readLine()!)!
    var tree = BinaryTree<Int>()
    
    for _ in 0..<Q {
        let query = readInts()
        let rawCommand = query[0], v = query[1]
        switch Command(rawValue: rawCommand)! {
        case .insert:
            tree.insert(v)
        case .search:
            print(tree.search(v) ? "Yes" : "No")
        case .delete:
            print(tree.delete(v) ? "Complete" : "Error")
        }
    }
    
    enum Command: Int {
        case insert, search, delete
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
        var key: T
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
        
        func search(value: T) -> [Node] {
            if value == key { return [self] }
            let child = value <= key ? left : right
            guard let child = child else { return [Node]() }
            var result = child.search(value: value)
            if result.count == 1 {
                result.append(self)
            }
            return result
        }
        
        func delete() -> Node? {
            let children = [left, right]
                .filter { $0 != nil }
                .map { $0! }
            
            guard !children.isEmpty else { return nil }
            guard children.count > 1 else { return children.first }
            
            let nextChild = right!.nextChildInorder()
            
            key = nextChild.key
            nextChild.delete()
            
            return self
        }
                
        private func nextChildInorder() -> Node {
            return left?.nextChildInorder() ?? self
        }
    }
    
    private var root: Node?
    
    mutating func insert(_ key: T) {
        let node = Node(key)
        root = root?.insert(node: node) ?? node
    }
    
    func search(_ key: T) -> Bool {
        guard let root = root else { return false }
        return !root.search(value: key).isEmpty
    }
    
    mutating func delete(_ key: T) -> Bool {
        guard let root = root else { return false }
        let lineage = root.search(value: key)
        guard !lineage.isEmpty else { return false }
        
        let node = lineage[0]
        let replacement = node.delete()
        
        guard lineage.count > 1 else {
            self.root = replacement
            return true
        }
        
        let parent = lineage[1]
        
        if key <= parent.key {
            parent.left = replacement
        } else {
            parent.right = replacement
        }
        
        return true
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
