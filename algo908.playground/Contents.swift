// https://algo-method.com/tasks/908
// 2022-05-13 08:03:40

import Foundation

struct Example {
    let input: String
    let expected: String
}

let examples: [(String, Example)] = [
    ("1", Example(
        input: """
            12
            0 1
            2 1
            3 1
            10 0
            10 11
            0 4
            4 5
            6 4
            6 8
            6 9
            4 7
            3
            6
            11
            8
            """,
        expected: """
            5 6 7
            11
            8 9
            """)),
    ("2", Example(
        input: """
            6
            2 1
            5 0
            4 3
            5 3
            2 4
            4
            3
            1
            4
            1
            """,
        expected: """
            3
            1
            4
            1
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
    
    let N = Int(readLine()!)!
    var connected = [Set<Int>](repeating: [], count: N)
    
    for _ in 0..<N-1 {
        let ab = readInts()
        let a = ab[0], b = ab[1]
        connected[a].insert(b)
        connected[b].insert(a)
    }
        
    var childrenString = [String](repeating: "", count: N)
    var parent = [Int](repeating: -1, count: N)
    
    func makeGraph(n: Int) {
        let children = connected[n]
        childrenString[n] = children
            .sorted()
            .map { String($0) }
            .joined(separator: " ")
        
        for child in children {
            parent[child] = n
            connected[child].remove(n)
            makeGraph(n: child)
        }
    }
    
    makeGraph(n: 0)
    
    let Q = Int(readLine()!)!
    
    for _ in 0..<Q {
        let v = Int(readLine()!)!
        print(childrenString[parent[v]])
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

func myDebugPrint (_ s: Any... ) { Swift.print(s.map {"\($0)"}.joined(separator: " ")) }
