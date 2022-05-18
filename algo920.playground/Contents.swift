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
        var parent: Node?
        var left: Node?
        var right: Node?
        
        init(_ key: T, parent: Node?) {
            self.key = key
            self.parent = parent
        }
        
        func insert(value: T) -> Node {
            if value <= key {
                left = left?.insert(value: value) ?? Node(value, parent: self)
            } else {
                right = right?.insert(value: value) ?? Node(value, parent: self)
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
        
        private func nextInorder() -> Node {
            return left?.nextInorder() ?? self
        }
        
        func delete(value: T, includeSelf: Bool = true) -> Node? {
            if value == key && includeSelf {
                return _delete()
            } else if value <= key {
                left = left?.delete(value: value)
            } else {
                right = right?.delete(value: value)
            }
            return self
        }
        
        private func _delete() -> Node? {
            guard left != nil else {
                right?.parent = parent
                return right
            }
            guard let right = right else {
                left?.parent = parent
                return left
            }
            
            let nextChild = right.nextInorder()
            key = nextChild.key
            
            nextChild.parent?.delete(value: key, includeSelf: false)
            
            return self
        }
    }
    
    private var root: Node?
    
    mutating func insert(_ key: T) {
        root = root?.insert(value: key) ?? Node(key, parent: nil)
    }
    
    func search(_ key: T) -> Bool {
        return root?.search(value: key) != nil
    }
    
    mutating func delete(_ key: T) -> Bool {
        guard search(key) else { return false }
        root = root?.delete(value: key)
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
