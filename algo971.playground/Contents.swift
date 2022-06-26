// https://algo-method.com/tasks/971
// 2022-06-26 12:55:26

import Foundation

struct Example {
    let input: String
    let expected: String
}

let examples: [(String, Example)] = [
    ("1", Example(
        input: """
            8 12
            0 5
            1 3
            1 6
            2 5
            2 7
            3 0
            3 7
            4 1
            4 2
            4 6
            6 7
            7 0
            """,
        expected: """
            No
            """)),
    ("2", Example(
        input: """
            5 5
            0 2
            4 1
            1 2
            2 4
            4 3
            """,
        expected: """
            Yes
            """)),
    ("3", Example(
        input: """
            7 6
            3 2
            4 1
            2 5
            4 0
            3 6
            0 1
            """,
        expected: """
            No
            """)),
]

func run(readLine: () -> String?, print: (Any...) -> Void) {
    // =====================
    // actual code goes here
    // =====================

    func readInts() -> [Int] { readLine()!.split(separator: " ").map { Int(String($0))! } }

    let nm = readInts()
    let n = nm[0], m = nm[1]
    
    var deg = [Int](repeating: 0, count: n)
    var graph = [[Int]](repeating: [], count: n)
    for _ in 0..<m {
        let ab = readInts()
        let a = ab[0], b = ab[1]
        graph[b].append(a)
        deg[a] += 1
    }
    
    var queue = ArraySlice<Int>()
    for v in 0..<n {
        graph[v].sort()
        if deg[v] == 0 { queue.append(v) }
    }
    
    var order = [Int]()
    while let v = queue.popFirst() {
        order.append(v)
        for v2 in graph[v] {
            deg[v2] -= 1
            if deg[v2] == 0 {
                queue.append(v2)
            }
        }
    }
    
    print(order.count != n ? "Yes" : "No")
    
    // ===============
    // actual code end
    // ===============
}

// =================================
// Extensions
// Remember to paste these as well!!
// =================================



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
