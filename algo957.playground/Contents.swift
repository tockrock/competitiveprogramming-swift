// https://algo-method.com/tasks/957
// 2022-06-17 22:39:27

import Foundation

struct Example {
    let input: String
    let expected: String
}

let examples: [(String, Example)] = [
    ("1", Example(
        input: """
            8 12 1 5
            0 1
            0 2
            0 4
            1 3
            1 7
            2 4
            3 2
            3 6
            5 3
            5 4
            6 5
            6 7
            """,
        expected: """
            Yes
            """)),
    ("2", Example(
        input: """
            8 12 5 1
            3 6
            5 4
            0 2
            1 7
            2 4
            0 4
            1 3
            0 1
            6 5
            6 7
            3 2
            5 3
            """,
        expected: """
            No
            """)),
    ("3", Example(
        input: """
            4 3 3 0
            1 2
            2 3
            3 1
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

    let nmst = readInts()
    let n = nmst[0], m = nmst[1], s = nmst[2], t = nmst[3]
    
    var graph = [[Int]](repeating: [], count: n)
    for _ in 0..<m {
        let ab = readInts()
        let a = ab[0], b = ab[1]
        graph[a].append(b)
    }
    
    var ans = false
    var travelled = [Bool](repeating: false, count: n)
    var queue = ArraySlice(graph[s])
    while let next = queue.popFirst(), !travelled[next] {
        guard next != t else {
            ans = true
            break
        }
        travelled[next] = true
        queue.append(contentsOf: graph[next])
    }
    
    print(ans ? "Yes" : "No")
    
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
