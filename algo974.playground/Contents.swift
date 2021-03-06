// https://algo-method.com/tasks/974
// 2022-06-26 13:47:10

import Foundation

struct Example {
    let input: String
    let expected: String
}

let examples: [(String, Example)] = [
    ("1", Example(
        input: """
            15
            0 1
            0 6
            0 14
            1 2
            1 4
            3 5
            3 6
            3 7
            6 9
            8 10
            8 14
            9 12
            9 13
            11 14
            """,
        expected: """
            3
            """)),
    ("2", Example(
        input: """
            6
            2 0
            4 3
            5 0
            1 5
            1 3
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

    let n = Int(readLine()!)!
    
    var graph = [[Int]](repeating: [], count: n)
    for _ in 0..<n-1 {
        let ab = readInts()
        let a = ab[0], b = ab[1]
        graph[a].append(b)
        graph[b].append(a)
    }
    
    var travelled = [Bool](repeating: false, count: n)
    func getDepth(from: Int, depth: Int) -> Int {
        travelled[from] = true
        var deepest = depth
        for next in graph[from] where !travelled[next] {
            deepest = max(deepest, getDepth(from: next, depth: depth + 1))
        }
        return deepest
    }
    
    print(getDepth(from: 0, depth: 0))

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
