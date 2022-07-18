// https://algo-method.com/tasks/952
// 2022-06-12 23:42:08

import Foundation

struct Example {
    let input: String
    let expected: String
}

let examples: [(String, Example)] = [
    ("1", Example(
        input: """
            8 12
            0 1
            0 4
            1 3
            1 7
            2 0
            2 4
            3 2
            3 6
            5 3
            5 4
            6 5
            6 7
            """,
        expected: """
            0 1 3 2 4 6 5 7
            """)),
    ("2", Example(
        input: """
            3 6
            1 2
            0 2
            1 0
            2 1
            2 0
            0 1
            """,
        expected: """
            0 1 2
            """)),
    ("3", Example(
        input: """
            6 9
            4 3
            0 5
            5 2
            2 3
            5 4
            4 5
            2 1
            1 4
            2 0
            """,
        expected: """
            0 5 2 1 4 3
            """)),
]

func run(readLine: () -> String?, print: (Any...) -> Void) {
    // =====================
    // actual code goes here
    // =====================
    
    func readInts() -> [Int] { readLine()!.split(separator: " ").map { Int(String($0))! } }

    let nm = readInts()
    let n = nm[0], m = nm[1]
    
    var graph = [[Int]](repeating: [], count: n)
    for _ in 0..<m {
        let ab = readInts()
        let a = ab[0], b = ab[1]
        graph[a].append(b)
    }
    
    for i in 0..<n {
        graph[i].sort()
    }
    
    var arrived = [Bool](repeating: false, count: n)
    
    var ans = [Int]()
    func rec(_ v: Int) {
        arrived[v] = true
        ans.append(v)
        for v2 in graph[v] {
            guard !arrived[v2] else { continue }
            rec(v2)
        }
    }
    
    rec(0)
    
    print(ans.map(\.description).joined(separator: " "))

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
