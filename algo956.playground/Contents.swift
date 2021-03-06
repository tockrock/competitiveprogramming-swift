// https://algo-method.com/tasks/956
// 2022-06-15 23:21:15

import Foundation

struct Example {
    let input: String
    let expected: String
}

let examples: [(String, Example)] = [
    ("1", Example(
        input: """
            9 11
            0 1
            0 2
            0 4
            1 8
            2 4
            2 8
            3 5
            3 6
            4 7
            5 6
            7 8
            """,
        expected: """
            2
            """)),
    ("2", Example(
        input: """
            6 8
            4 3
            0 5
            2 5
            2 3
            4 5
            2 1
            1 4
            2 0
            """,
        expected: """
            1
            """)),
    ("3", Example(
        input: """
            5 1
            3 1
            """,
        expected: """
            4
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
        graph[b].append(a)
    }
    
    var arrived = [Bool](repeating: false, count: n)
    func rec(_ v: Int) {
        arrived[v] = true
        for v2 in graph[v] where !arrived[v2] {
            rec(v2)
        }
    }
    
    var ans = 0
    for i in 0..<n where !arrived[i] {
        ans += 1
        rec(i)
    }
    
    print(ans)
    
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
