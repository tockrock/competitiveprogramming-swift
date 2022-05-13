// https://algo-method.com/tasks/913
// 2022-05-14 07:43:50

import Foundation

struct Example {
    let input: String
    let expected: String
}

let examples: [(String, Example)] = [
    ("1", Example(
        input: """
            12
            1 2
            3 4
            5 6
            -1 -1
            7 -1
            8 9
            -1 10
            -1 -1
            -1 -1
            11 -1
            -1 -1
            -1 -1
            """,
        expected: """
            3 1 7 4 0 8 5 11 9 2 6 10
            """)),
    ("2", Example(
        input: """
            6
            -1 2
            -1 5
            4 -1
            -1 -1
            -1 1
            3 -1
            """,
        expected: """
            0 4 1 3 5 2
            """)),
]

// =================================
// Extensions
// Remember to paste these as well!!
// =================================

func run(readLine: () -> String?, print: (Any...) -> Void) {
    // =====================
    // actual code goes here
    // =====================
    
    func readInts() -> [Int] { readLine()!.split(separator: " ").map { Int(String($0))! } }
    
    struct BinaryTree {
        private struct Node {
            let left: Int?
            let right: Int?
        }
        
        private var nodes = [Node]()
        
        mutating func append(l: Int, r: Int) {
            let left: Int? = l != -1 ? l : nil
            let right: Int? = r != -1 ? r : nil
            
            nodes.append(Node(left: left, right: right))
        }
                
        func inOrder(v: Int?, result: inout [Int]) {
            guard let v = v else { return }
            inOrder(v: nodes[v].left, result: &result)
            result.append(v)
            inOrder(v: nodes[v].right, result: &result)
        }
    }
    
    let N = Int(readLine()!)!
    var tree = BinaryTree()
    for _ in 0..<N {
        let lr = readInts()
        let l = lr[0], r = lr[1]
        tree.append(l: l, r: r)
    }
    
    var result = [Int]()
    tree.inOrder(v: 0, result: &result)
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
